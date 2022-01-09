const core = require('@actions/core')
const exec = require('@actions/exec')

// FIXME: get this from the outputs of the flatpak-builder action
const LOCAL_REPO_NAME = 'repo'

const run = (repository, flatManagerUrl, token, endOfLife, endOfLifeRebase) => {
  exec.exec('flatpak', [
    'build-update-repo',
    '--generate-static-deltas',
    LOCAL_REPO_NAME
  ])
    .then(async () => {
      let buildId = ''
      let args = [
        '--token',
        token
      ]

      if (endOfLife) {
        args.push_back(`--end-of-life=${endOfLife}`)
      }

      if (endOfLifeRebase) {
        if (!endOfLife) {
          throw Error('end-of-life has to be set if you want to use end-of-life-rebase')
        }

        args.push_back(`--end-of-life-rebase=${endOfLifeRebase}`)
      }

      args = args.concat([
        'create',
        flatManagerUrl,
        repository
      ])

      const exitCode = await exec.exec('flat-manager-client', args, {
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
    core.getInput('token'),
    core.getInput('end-of-life'),
    core.getInput('end-of-life-rebase')
  )
}
