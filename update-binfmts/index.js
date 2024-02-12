const core = require('@actions/core')
const exec = require('@actions/exec')
const fs = require('fs').promises

const run = async () => {
  core.info('Checking for /usr/bin/update-binfmts...')
  if (!(await fs.stat('/usr/bin/update-binfmts')).isFile()) {
    core.info('Failed to find update-binfmts')
    return
  }

  core.info('Mounting /proc/sys/fs/binfmt_misc...')
  try {
    await exec.exec('mount binfmt_misc -t binfmt_misc /proc/sys/fs/binfmt_misc')
  } catch (err) {
    core.info('Failed to mount binfmt_misc')
    return
  }

  core.info('Loading binfmt templates...')
  await exec.exec('update-binfmts --import')

  core.info('Unmounting /proc/sys/fs/binfmt_misc...')
  await exec.exec('umount /proc/sys/fs/binfmt_misc')
}

if (require.main === module) {
  run()
}
