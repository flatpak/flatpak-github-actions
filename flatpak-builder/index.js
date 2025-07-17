const core = require('@actions/core')
const exec = require('@actions/exec')
const { DefaultArtifactClient } = require('@actions/artifact')
const cache = require('@actions/cache')
const path = require('path')
const fs = require('fs').promises
const yaml = require('js-yaml')
const crypto = require('crypto')
const { spawn } = require('child_process')

// The various paths to cache
const CACHE_PATH = [
  '.flatpak-builder'
]

/**
 * The options the action can take
 */
class Configuration {
  constructor () {
    // The flatpak manifest path
    this.manifestPath = core.getInput('manifest-path')
    // The module where the build should stop
    this.stopAtModule = core.getInput('stop-at-module') || null
    // Whether to run tests or not
    this.runTests = core.getBooleanInput('run-tests')
    // The bundle name
    this.bundle = core.getInput('bundle') || 'app.flatpak'
    this.branch = core.getInput('branch') || 'master'
    // Whether to build a bundle or not
    this.buildBundle = core.getBooleanInput('build-bundle')
    // Whether to restore the cache or not
    this.restoreCache = core.getBooleanInput('restore-cache')
    // Whether to enable caching the build directory
    this.cacheBuildDir = core.getBooleanInput('cache')
    // The repository used to install the runtime from
    this.repositoryUrl = core.getInput('repository-url')
    // The repository name to install the runtime from
    this.repositoryName = core.getInput('repository-name')
    // The default cache key if there are any
    this._cacheKey = core.getInput('cache-key')
    // The CPU architecture to build for
    this.arch = core.getInput('arch')
    // The URL to mirror screenshots
    this.mirrorScreenshotsUrl = core.getInput('mirror-screenshots-url')
    // The key to sign the package
    this.gpgSign = core.getInput('gpg-sign')
    // Modified manifest path
    this.modifiedManifestPath = path.join(
      path.dirname(this.manifestPath),
      `flatpak-github-action-modified-${path.basename(this.manifestPath)}`
    )
    // Computed manifest hash
    this._manifestHash = null
    // Where to build the application
    this.buildDir = 'flatpak_app'
    // The flatpak repository name
    this.localRepoName = 'repo'
    // Verbosity
    this.verbose = core.getBooleanInput('verbose')
    // Upload the artifact
    this.uploadArtifact = core.getBooleanInput('upload-artifact')
    // Bundle sources
    this.bundleSources = core.getBooleanInput('bundle-sources')
  }

  async cacheKey () {
    if (!this._cacheKey) {
      try {
        if (!this._manifestHash) { this._manifestHash = (await computeHash(this.manifestPath)).substring(0, 20) }
        return `flatpak-builder-${this.arch}-${this._manifestHash}`
      } catch (err) {
        core.setFailed(`Fail to create create cache key based on manifest hash: ${err}`)
      }
    }
    // Ensure the cache key is unique if we're building multiple architectures in the same job
    return `${this._cacheKey}-${this.arch}`
  }
}

/**
 * Start a D-Bus session and return the process and the D-Bus address.
 *
 * @returns {Promise}
 */
const startDBusSession = () => {
  return new Promise((resolve, reject) => {
    const dbus = spawn('dbus-daemon', ['--session', '--print-address'])
    dbus.stdout.on('data', (data) => {
      try {
        const decoder = new TextDecoder()
        dbus.address = decoder.decode(data).trim()

        resolve(dbus)
      } catch (e) {
        dbus.kill()
        reject(e)
      }
    })
  })
}

/**
 * Compute a SHA-256 hash of a file.
 *
 * @param {PathLike} path The file path.
 */
const computeHash = async (path) => {
  const hash = crypto.createHash('sha256')
  const stream = await fs.readFile(path)

  const buffer = Buffer.alloc(stream.byteLength)
  for (let i = 0; i < buffer.length; i++) {
    buffer[i] = stream[i]
  }
  hash.update(buffer)

  return hash.digest('hex')
}

/**
 * Parses a Flatpak manifest
 *
 * @param {PathLike} manifestPath The path to the manifest
 * @returns {object} The manifest
 */
const parseManifest = async (manifestPath) => {
  const data = await fs.readFile(manifestPath)
  let manifest = null
  switch (path.extname(manifestPath)) {
    case '.json':
      manifest = JSON.parse(data)
      break
    case '.yaml':
    case '.yml':
      manifest = yaml.load(data)
      break
    default:
      core.setFailed(
        'Unsupported manifest format, please use a YAML or a JSON file'
      )
  }
  return manifest
}

/**
 * Saves a manifest as a YAML or JSON file
 *
 * @param {object} manifest A Flatpak manifest
 * @param {PathLike} dest Where to save the flatpak manifest
 * @returns {object} The manifest
 */
const saveManifest = async (manifest, dest) => {
  let data = null
  switch (path.extname(dest)) {
    case '.json':
      data = JSON.stringify(manifest)
      break
    case '.yaml':
    case '.yml':
      data = yaml.dump(manifest)
      break
    default:
      core.setFailed(
        'Unsupported manifest format, please use a YAML or a JSON file'
      )
  }
  await fs.writeFile(dest, data)
  return manifest
}

/**
 * Modify the manifest to prepare it for tests.
 *
 * Applies the following changes to the original manifest:
 * - Add test-args are to enable network & x11 access.
 *
 * @param {Object} manifest The parsed manifest
 * @param {boolean} runTests Whether to run tests or not
 * @param {Object} testEnv Dictionary of environment variables
 * @returns {object} The modified manifest
 */
const modifyManifest = (manifest, runTests = false, testEnv = {}) => {
  if (runTests) {
    const buildOptions = manifest['build-options'] || {}
    const env = Object.assign({
      ...(buildOptions.env || {}),
      DISPLAY: '0:0'
    }, testEnv)
    const testArgs = [
      '--socket=x11',
      '--share=network',
      ...(buildOptions['test-args'] || [])
    ]

    manifest['build-options'] = {
      ...buildOptions,
      'test-args': testArgs,
      env
    }
    const module = manifest.modules.slice(-1)[0]
    module['run-tests'] = runTests
  }
  return manifest
}

/**
 * Build the Flatpak & create a bundle from the build
 *
 * @param {object} manifest A Flatpak manifest
 * @param {PathLike} manifestPath The Flatpak manifest path
 * @param {string} cacheHitKey The key used to restore the build directory
 * @param {Configuration} config The build configuration
 */
const build = async (manifest, manifestPath, cacheHitKey, config) => {
  const appId = manifest['app-id'] || manifest.id
  const branch = manifest.branch || config.branch
  let cacheKey
  if (config.cacheBuildDir) { cacheKey = await config.cacheKey() }

  core.info('Building the flatpak...')

  const args = [
    `--repo=${config.localRepoName}`,
    '--disable-rofiles-fuse',
    `--install-deps-from=${config.repositoryName}`,
    '--force-clean',
    `--default-branch=${branch}`,
    `--arch=${config.arch}`
  ]
  if (config.arch === 'x86_64' && config.bundleSources !== false) {
    args.push('--bundle-sources')
  }
  if (config.cacheBuildDir) {
    args.push('--ccache')
  }
  if (config.mirrorScreenshotsUrl) {
    args.push(`--mirror-screenshots-url=${config.mirrorScreenshotsUrl}`)
  }
  if (config.gpgSign) {
    args.push(`--gpg-sign=${config.gpgSign}`)
  }
  if (config.stopAtModule) {
    args.push(`--stop-at=${config.stopAtModule}`)
  }
  if (config.verbose) {
    args.push('--verbose')
  }
  args.push(config.buildDir, manifestPath)

  await exec.exec('xvfb-run --auto-servernum flatpak-builder', args)

  if (config.cacheBuildDir && (cacheKey !== cacheHitKey)) {
    await cache.saveCache(
      CACHE_PATH,
      cacheKey
    ).catch((reason) => {
      core.error(`Failed to save cache: ${reason}`)
    })
  }

  if (config.buildBundle && !config.stopAtModule) {
    core.info('Creating a bundle...')
    const args = [
      'build-bundle',
      config.localRepoName,
      config.bundle,
      `--runtime-repo=${config.repositoryUrl}`,
      `--arch=${config.arch}`,
      appId,
      branch
    ]
    if (manifest['build-runtime'] || manifest['build-extension']) {
      args.push('--runtime')
    }
    if (config.verbose) {
      args.push('-vv', '--ostree-verbose')
    }
    await exec.exec('flatpak', args)
  }

  if (config.mirrorScreenshotsUrl) {
    core.info('Committing screenshots...')

    const ostreeArgs = [
      'commit',
      `--repo=${config.localRepoName}`,
      '--canonical-permissions',
      `--branch=screenshots/${config.arch}`,
      `${config.buildDir}/files/share/app-info/media`
    ]

    if (config.verbose) {
      ostreeArgs.push('--verbose')
    }

    exec.exec(
      'ostree',
      ostreeArgs
    )
  }
}

/**
 * Initialize the build
 *
 * Consists of setting up the Flatpak remote if one other than the default is set
 * and restoring the cache from the latest build
 *
 * @param {Configuration} config The build configuration
 * @returns {Promise<String>} The cacheHitKey if a cache was hit
 */
const prepareBuild = async (config) => {
  /// If the user has set a different runtime source
  if (config.repositoryUrl !== 'https://flathub.org/repo/flathub.flatpakrepo') {
    const args = [
      'remote-add',
      '--if-not-exists',
      config.repositoryName,
      config.repositoryUrl
    ]
    if (config.verbose) {
      args.push('-vv', '--ostree-verbose')
    }
    await exec.exec('flatpak', args)
  }

  // Restore the cache in case caching is enabled
  let cacheHitKey
  if (config.cacheBuildDir && config.restoreCache) {
    const cacheKey = await config.cacheKey()
    cacheHitKey = await cache.restoreCache(
      CACHE_PATH,
      `${cacheKey}`,
      [
        `flatpak-builder-${this.arch}`
      ]
    )
    if (cacheHitKey !== undefined) {
      core.info(`Restored cache with key: ${cacheHitKey}`)
    } else {
      core.info('No cache was found')
    }
  }
  return cacheHitKey
}

/**
 * Run a complete build
 *
 * @param {Configuration} config The build configuration
 */
const run = async (config) => {
  if (config.verbose) {
    await exec.exec('flatpak --version')
    await exec.exec('flatpak-builder --version')
    await exec.exec('ostree --version')
  }

  let cacheHitKey
  try {
    cacheHitKey = await prepareBuild(config)
  } catch (err) {
    core.setFailed(`Failed to prepare the build ${err}`)
  }

  const testEnv = {}
  let dbusSession = null

  if (config.runTests) {
    dbusSession = await startDBusSession()
    testEnv.DBUS_SESSION_BUS_ADDRESS = dbusSession.address
  }

  parseManifest(config.manifestPath)
    .then((manifest) => {
      const modifiedManifest = modifyManifest(manifest, config.runTests, testEnv)
      return saveManifest(modifiedManifest, config.modifiedManifestPath)
    })
    .then((manifest) => {
      return build(manifest, config.modifiedManifestPath, cacheHitKey, config)
    })
    .then(() => {
      if (dbusSession) {
        dbusSession.kill()
        dbusSession = null
      }

      if (!config.buildBundle || config.stopAtModule) {
        return
      }

      if (!config.uploadArtifact) {
        core.info('Skipping artifact upload!')
        return
      }

      const artifactClient = new DefaultArtifactClient()
      core.info('Uploading artifact...')
      // Append the arch to the bundle name to prevent conflicts in multi-arch jobs
      const bundleName = config.bundle.replace('.flatpak', '') + `-${config.arch}.flatpak`
      return artifactClient.uploadArtifact(bundleName, [config.bundle], '.', {
        continueOnError: false
      })
    })
    .catch((error) => {
      if (dbusSession) {
        dbusSession.kill()
        dbusSession = null
      }

      core.setFailed(`Build failed: ${error}`)
    })
}

module.exports = {
  computeHash,
  parseManifest,
  modifyManifest
}

if (require.main === module) {
  const config = new Configuration()
  run(config)
}
