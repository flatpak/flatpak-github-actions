const core = require('@actions/core')
const { spawn } = require('child_process')

const docker_args = ['run', '--cap-add', 'SYS_ADMIN', '--cap-add',
    'NET_ADMIN', '--device', '/dev/fuse', '--security-opt', 'apparmor:unconfined',
    '--security-opt', 'seccomp=unconfined', '--workdir', '/github/workspace',
    '--rm', '-e', 'INPUT_ARGS', '-e', 'HOME', '-e', 'GITHUB_REF', '-e', 'GITHUB_SHA',
    '-e', 'GITHUB_REPOSITORY', '-e', 'GITHUB_ACTOR', '-e', 'GITHUB_WORKFLOW',
    '-e', 'GITHUB_HEAD_REF', '-e', 'GITHUB_BASE_REF', '-e', 'GITHUB_EVENT_NAME',
    '-e', 'GITHUB_WORKSPACE', '-e', 'GITHUB_ACTION', '-e', 'GITHUB_EVENT_PATH',
    '-e', 'RUNNER_OS', '-e', 'RUNNER_TOOL_CACHE', '-e', 'RUNNER_TEMP', '-e',
    'RUNNER_WORKSPACE', '-v', '/var/run/docker.sock:/var/run/docker.sock',
    '-v', '/home/runner/work/_temp/_github_home:/github/home', '-v',
    '/home/runner/work/_temp/_github_workflow:/github/workflow', '-v',
    process.env.GITHUB_WORKSPACE + ':/github/workspace', '-i',
    'nahuelwexd/flatpak-docker:latest']

if (core.getInput('manifest-path') !== '') {
    docker_args.push('--manifest-path', core.getInput('manifest-path'))
}

if (core.getInput('meson-args') !== '') {
    docker_args.push('--meson-args', core.getInput('meson-args'))
}

if (core.getInput('flatpak-module') !== '') {
    docker_args.push('--flatpak-module', core.getInput('flatpak-module'))
}

if (core.getInput('app-id') !== '') {
    docker_args.push('--app-id', core.getInput('app-id'))
}

if (core.getInput('runtime-repo') !== '') {
    docker_args.push('--runtime-repo', core.getInput('runtime-repo'))
}

if (core.getInput('bundle') !== '') {
    docker_args.push('--bundle', core.getInput('bundle'))
}

const docker = spawn('docker', docker_args, {
    shell: true
})

docker.stdout.on('data', (data) => {
    process.stdout.write(`${data}`)
})

docker.stderr.on('data', (data) => {
    process.stderr.write(`${data}`)
})

docker.on('close', (code) => {
    process.exit(code)
})
