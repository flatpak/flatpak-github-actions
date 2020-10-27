const core = require("@actions/core")
const exec = require("@actions/exec")
const artifact = require("@actions/artifact")
const path = require("path")
const fs = require("fs").promises
const yaml = require("js-yaml")

/**
 * Parses a flatpak manifest and returns it as a JS object
 * It supports both supported file formats by flatpak-builder: JSON & YAML.
 *
 * @param {string} manifestPath the relative/absolute path to the manifest
 */
const parseManifest = async (manifestPath) => {
    const data = await fs.readFile(manifestPath)
    let manifest = null
    switch (path.extname(manifestPath)) {
        case ".json":
            manifest = JSON.parse(data)
            break
        case ".yaml":
        case ".yml":
            manifest = yaml.safeLoad(data)
            break
        default:
            core.setFailed(
                "Unsupported manifest format, please use a YAML or a JSON file"
            )
    }
    return manifest
}

/**
 * Saves a manifest as a YAML or JSON file
 *
 * @param {object} manifest A flatpak manifest
 * @param {string} dest Where to save the flatpak manifest
 * @returns {object} manifest
 */
const saveManifest = async (manifest, dest) => {
    let data = null
    switch (path.extname(dest)) {
        case ".json":
            data = JSON.stringify(manifest)
            break
        case ".yaml":
        case ".yml":
            data = yaml.safeDump(manifest)
            break
        default:
            core.setFailed(
                "Unsupported manifest format, please use a YAML or a JSON file"
            )
    }
    await fs.writeFile(dest, data)
    return manifest
}

/**
 * Applies two changes to the original manifest:
 * 1 - If tests are enabled, proper test-args are added
 *      to enable network & x11 access.
 * 2 - Replaces the source type of the latest module to a dir
 *     this will allow us to build the current commit/change
 *
 * @param {Object} manifest the parsed manifest
 * @param {callback} callback a callback to call on the modified manifest
 * @returns {object} manifest the modified manifest
 */
const modifyManifest = (manifest, manifestPath, runTests = false) => {
    if (runTests) {
        const buildOptions = manifest["build-options"] || {}
        const env = {
            ...(buildOptions.env || {}),
            DISPLAY: "0:0",
        }
        const testArgs = [
            "--socket=x11",
            "--share=network",
            ...(buildOptions["test-args"] || []),
        ]

        manifest["build-options"] = {
            ...buildOptions,
            "test-args": testArgs,
            env: env,
        }
    }
    const module = manifest["modules"].slice(-1)[0]
    module["run-tests"] = runTests

    return manifest
}

/**
 * Build the flatpak & create a bundle from the build
 *
 * @param {object} manifest A flatpak manifest
 * @param {object} manifestPath The flatpak manifest path
 * @param {string} bundle The bundle's name
 * @param {string} runtimeRepo The repository used to install the runtime from
 * @param {string} buildDir Where to build the application
 * @param {string} repoName The flatpak repository name
 */
const build = async (manifest, manifestPath, bundle, runtimeRepo, buildDir, repoName) => {
    const appId = manifest["app-id"] || manifest["id"]
    const branch = manifest["branch"] || core.getInput("branch") || "master"

    core.info("Building the flatpak...")

    await exec.exec(`xvfb-run --auto-servernum flatpak-builder`, [
        `--repo=${repoName}`,
        "--disable-rofiles-fuse",
        "--install-deps-from=flathub",
        buildDir,
        manifestPath,
    ])

    core.info("Creating a bundle...")
    await exec.exec("flatpak", [
        "build-bundle",
        repoName,
        bundle,
        `--runtime-repo=${runtimeRepo}`,
        appId,
        branch,
    ])
}

/**
 * Run a complete build
 *
 * @param {object} manifestPath The flatpak manifest path
 * @param {boolean} runTests Whether to run tests or not
 * @param {string} bundle The bundle's name
 * @param {string} runtimeRepo The repository used to install the runtime from
 * @param {string} buildDir Where to build the application
 * @param {string} repoName The flatpak repository name
 */
const run = async (
    manifestPath,
    runTests,
    bundle,
    runtimeRepo,
    buildDir,
    repoName
) => {
    parseManifest(manifestPath)
        .then((manifest) => {
            const modifiedManifest = modifyManifest(manifest, manifestPath, runTests)
            return saveManifest(modifiedManifest, manifestPath)
        })
        .then((manifest) => {
            return build(manifest, manifestPath, bundle, runtimeRepo, buildDir, repoName)
        })
        .then(() => {
            core.info("Uploading artifact...")
            const artifactClient = artifact.create()

            return artifactClient.uploadArtifact(bundle.replace('.flatpak', ''), [bundle], ".", {
                continueOnError: false,
            })
        })
        .catch((error) => {
            core.setFailed(`Build failed: ${error}`)
        })
}

module.exports = {
    parseManifest,
    modifyManifest,
    saveManifest,
    build,
    run,
}

if (require.main === module) {
    run(
        core.getInput("manifest-path"),
        ["y", "yes", "true", "enabled"].includes(core.getInput("run-tests")),
        core.getInput("bundle") || "app.flatpak",
        core.getInput("runtime-repo"),
        "flatpak_app",
        "repo"
    )
}
