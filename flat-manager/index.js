const core = require('@actions/core')
const exec = require('@actions/exec')

// FIXME: get this from the outputs of the flatpak-builder action
const LOCAL_REPO_NAME = 'repo'

const validateFlathubProfile = async (repository, flatManagerUrl, token) => {
  // TODO
}

const PROFILES = {
  'flathub': validateFlathubProfile,
}

const validateProfile = async (repository, flatManagerUrl, token, profile) => {
  if (!profile)
    return Promise.resolve()

  if (!PROFILES[profile])
    throw Error(`Unknown profile ${profile}`)

  const validateFunc = PROFILES[profile]
  return validateFunc(repository, flatManagerUrl, token)
}

const run = (repository, flatManagerUrl, token, profile) => {
  validateProfile(repository, flatManagerUrl, token, profile)
    .then(async () => {
      await exec.exec('flatpak', [
        'build-update-repo',
        '--generate-static-deltas',
        LOCAL_REPO_NAME
      ])
    })
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
    core.getInput('token'),
    core.getInput('profile')
  )
}
