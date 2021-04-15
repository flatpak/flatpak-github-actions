const core = require("@actions/core")
const exec = require("@actions/exec")

// FIXME: get this from the outputs of the flatpak-builder action
const LOCAL_REPO_NAME = "repo" 


const run = async (repository, flatManagerUrl, token) => {
    await exec.exec('flatpak', [
        'build-update-repo',
        '--generate-static-deltas',
        LOCAL_REPO_NAME,
    ])

    const buildId = await exec.exec('flat-manager-client', [
        'create',
        flatManagerUrl,
        repository,
        '--token',
        token
    ])

    exec.exec('flat-manager-client', [
        'push', 
        '--commit',
        '--publish',
        '--wait',
        '--token',
        token,        
        buildId,
        LOCAL_REPO_NAME,
    ]).then(() => {
        core.info(`Build published successfully: ${buildId}`)
    }).catch((err) => {
        core.setFailed(`Failed to commit the build: ${err}`)
    })
    
    await exec.exec('flat-manager-client', [
        'purge',
        buildId,
    ])
}

if (require.main === module) {
    run(
        core.getInput('repository'),
        core.getInput('flat-manager-url'),
        core.getInput('token')
    )
}