const core = require('@actions/core')
const exec = require('@actions/exec')
const artifact = require('@actions/artifact')


const bundle = core.getInput("bundle") || "app.flatpak"
const artifactName = bundle.replace(".flatpak", "")
const runtimeRepo = core.getInput("runtime-repo") || "https://flathub.org/repo/flathub.flatpakrepo"
const manifestPath = core.getInput('manifest-path')
const flatpakModule = core.getInput('flatpak-module')
const appId = core.getInput('app-id')
const branch = "master"


const run = async () => {
    try {
        if (flatpakModule)
            await exec.exec('rewrite-flatpak-manifest', [manifestPath, flatpakModule])

        process.stdout.write('Building the flatpak...')
        await exec.exec('flatpak-builder', [
            '--repo=repo',
            '--disable-rofiles-fuse',
            "--install-deps-from=flathub",
            'flatpak_app',
            manifestPath,
        ])


        process.stdout.write('Creating a bundle...')
        await exec.exec('flatpak', [
            'build-bundle',
            'repo',
            bundle,
            `--runtime-repo=${runtimeRepo}`,
            appId,
            branch,
        ])


        process.stdout.write('Uploading artifact...')
        const artifactClient = artifact.create()

        await artifactClient.uploadArtifact(artifactName, [bundle], '.', {
            continueOnError: false
        })
    } catch (error) {
        core.setFailed(`Something failed ${error}`)
    }
}

run()

export default run