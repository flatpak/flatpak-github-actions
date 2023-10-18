const core = require('@actions/core')
const exec = require('@actions/exec')

class Configuration {
  constructor () {
    this.repository = core.getInput('repository')
    this.flatManagerUrl = core.getInput('flat-manager-url')
    this.token = core.getInput('token')
    this.endOfLife = core.getInput('end-of-life')
    this.endOfLifeRebase = core.getInput('end-of-life-rebase')
    this.buildLogUrl = core.getInput('build-log-url')
    // FIXME: get this from the outputs of the flatpak-builder action
    this.localRepoName = 'repo'
    // Verbosity
    this.verbose = core.getBooleanInput('verbose')
  }
}

const run = async (config) => {
  if (config.endOfLifeRebase) {
    if (!config.endOfLife) {
      throw Error('end-of-life has to be set if you want to use end-of-life-rebase')
    }
  }

  if (config.verbose) {
    await exec.exec('flatpak --version')
    await exec.exec('flatpak-builder --version')
    await exec.exec('ostree --version')
  }

  const args = [
    'build-update-repo',
    '--generate-static-deltas',
    config.localRepoName
  ]
  if (config.verbose) {
    args.push('-vv', '--ostree-verbose')
  }
  exec.exec('flatpak', args)
    .then(async () => {
      let buildId = ''
      let args = [
        '--token',
        config.token
      ]

      if (config.verbose) {
        args.push('--verbose')
      }

      args = args.concat([
        'create',
        config.flatManagerUrl,
        config.repository
      ])

      if (config.buildLogUrl) {
        args.push(`--build-log-url=${config.buildLogUrl}`)
      }

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
      let args = [
        '--token',
        config.token
      ]

      if (config.verbose) {
        args.push('--verbose')
      }

      args = args.concat([
        'push',
        '--commit',
        '--publish',
        '--wait'
      ])

      if (config.endOfLife) {
        args.push(`--end-of-life=${config.endOfLife}`)
      }

      if (config.endOfLifeRebase) {
        args.push(`--end-of-life-rebase=${config.endOfLifeRebase}`)
      }

      args = args.concat([
        buildId,
        config.localRepoName
      ])

      await exec.exec('flat-manager-client', args)
      return buildId
    })
    .then(async (buildId) => {
      let args = [
        '--token',
        config.token
      ]

      if (config.verbose) {
        args.push('--verbose')
      }

      args = args.concat([
        'purge',
        buildId
      ])

      await exec.exec('flat-manager-client', args)
    })
    .catch((err) => {
      core.setFailed(`Failed to publish the build: ${err}`)
    })
}

if (require.main === module) {
  const config = new Configuration()
  run(config)
}
