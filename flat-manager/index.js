const core = require('@actions/core')
const exec = require('@actions/exec')

// FIXME: get this from the outputs of the flatpak-builder action
const LOCAL_REPO_NAME = 'repo'

const run = (repository, flatManagerUrl, token) => {
  exec.exec('flatpak', [
    'build-update-repo',
    '--generate-static-deltas',
    LOCAL_REPO_NAME
  ])
    .then(async () => {
      let buildId = ''
      const exitCode = await exec.exec('flat-manager-client', [
        '--token',
        token,
        'create',
        flatManagerUrl,
        repository
      ], {
        listeners: {
          stdout: (data) => {
            buildId += data.toString().trim()
          }
        }
      })
      if (exitCode !== 0) {
        throw Error('flat-manager-client failed to create a new build')
      }
      return buildId
    })
    .then(async (buildId) => {
      await exec.exec('flat-manager-client', [
        '--token',
        token,
        'push',
        '--commit',
        '--publish',
        '--wait',
        buildId,
        LOCAL_REPO_NAME
      ])
      return buildId
    })
    .then(async (buildId) => {
      await exec.exec('flat-manager-client', [
        '--token',
        token,
        'purge',
        buildId
      ])
    })
    .catch((err) => {
      core.setFailed(`Failed to publish the build: ${err}`)
    })
}

if (require.main === module) {
  run(
    core.getInput('repository'),
    core.getInput('flat-manager-url'),
    core.getInput('token')
  )
}
