const core = require('@actions/core')
const exec = require('@actions/exec')
const artifact = require('@actions/artifact')
const path = require('path')
const fs = require('fs')
const yaml = require('js-yaml')

const bundle = core.getInput('bundle') || 'app.flatpak'
const artifactName = bundle.replace('.flatpak', '')
const runtimeRepo = core.getInput('runtime-repo')
const manifestPath = core.getInput('manifest-path')
const runTests = ['y', 'yes', 'true', 'enabled'].includes(core.getInput('run-tests'))
const branch = 'master'
const buildDir = 'flatpak_app'
const repoName = 'repo'


const parseManifest = (manifestPath, callback) => {
    fs.readFile(manifestPath, (err, data) => {
        if (err)
            core.setFailed(`Failed to parse the manifest ${err}`)
        let manifest = null
        switch (path.extname(manifestPath)) {
            case '.json':
                manifest = JSON.parse(data)
                break
            case '.yaml':
            case '.yml':
                manifest = yaml.safeLoad(data)
                break
            default:
                core.setFailed('Unsupported manifest format, please use a YAML or a JSON file')
        }
        callback(manifest, manifestPath)
    })
}

const saveManifest = (manifestPath, manifest, callback) => {
    let data = null
    switch (path.extname(manifestPath)) {
        case '.json':
            data = JSON.stringify(manifest)
            break
        case '.yaml':
        case '.yml':
            data = yaml.safeDump(manifest)
            break
    }

    fs.writeFile(manifestPath, data, (err) => {
        if (err)
            core.setFailed(`Failed to save the manifest ${err}`)
        callback(manifest)
    })
}

const initBuild = (manifestPath, callback) => {
    parseManifest(manifestPath, (manifest, manifestPath) => {
        if (runTests) {
            manifest['build-options'] = {
                ...manifest['build-options'] || {},
                ...{
                    'test-args': [
                        '--socket=x11',
                        '--share=network',
                    ],
                    'env': {
                        'DISPLAY': '0:0'
                    }
                }
            }
        }
        const module = manifest['modules'].slice(-1)[0]
        module['run-tests'] = runTests

        module['sources'] = module.sources.map((source) => {
            if (source.type === 'git') {
                return {
                    type: 'dir',
                    path: path.resolve('.', path.dirname(manifestPath)),
                }
            }
            return source
        })
        saveManifest(manifestPath, manifest, callback)
    })
}

const build = async (manifest) => {
    const appId = manifest['app-id']
    core.info('Building the flatpak...')

    await exec.exec(`xvfb-run --auto-servernum flatpak-builder`, [
        `--repo=${repoName}`,
        '--disable-rofiles-fuse',
        '--install-deps-from=flathub',
        buildDir,
        manifestPath,
    ])

    core.info('Creating a bundle...')
    await exec.exec('flatpak', [
        'build-bundle',
        repoName,
        bundle,
        `--runtime-repo=${runtimeRepo}`,
        appId,
        branch,
    ])

    core.info('Uploading artifact...')
    const artifactClient = artifact.create()

    await artifactClient.uploadArtifact(artifactName, [bundle], '.', {
        continueOnError: false
    })
}

const run = async () => {
    try {
        initBuild(manifestPath, (manifest) => {
            Promise.resolve(build(manifest))
        })
    } catch (error) {
        core.setFailed(`Build failed: ${error}`)
    }
}

run()

//export default run