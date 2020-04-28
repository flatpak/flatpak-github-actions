module.exports =
/******/ (function(modules, runtime) { // webpackBootstrap
/******/ 	"use strict";
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	__webpack_require__.ab = __dirname + "/";
/******/
/******/ 	// the startup function
/******/ 	function startup() {
/******/ 		// Load entry module and return exports
/******/ 		return __webpack_require__(410);
/******/ 	};
/******/
/******/ 	// run startup
/******/ 	return startup();
/******/ })
/************************************************************************/
/******/ ({

/***/ 129:
/***/ (function(module) {

module.exports = require("child_process");

/***/ }),

/***/ 410:
/***/ (function(__unusedmodule, __unusedexports, __webpack_require__) {

const core = __webpack_require__(739)
const { spawn } = __webpack_require__(129)

const docker_args = ['run', '--security-opt', 'seccomp=flatpak-docker-seccomp.json',
    '--workdir', '/github/workspace', '--rm', '-e', 'INPUT_ARGS', '-e', 'HOME',
    '-e', 'GITHUB_REF', '-e', 'GITHUB_SHA', '-e', 'GITHUB_REPOSITORY', '-e',
    'GITHUB_ACTOR', '-e', 'GITHUB_WORKFLOW', '-e', 'GITHUB_HEAD_REF', '-e',
    'GITHUB_BASE_REF', '-e', 'GITHUB_EVENT_NAME', '-e', 'GITHUB_WORKSPACE',
    '-e', 'GITHUB_ACTION', '-e', 'GITHUB_EVENT_PATH', '-e', 'RUNNER_OS', '-e',
    'RUNNER_TOOL_CACHE', '-e', 'RUNNER_TEMP', '-e', 'RUNNER_WORKSPACE',
    '-v', '/proc:/host/proc', '-v', '/var/run/docker.sock:/var/run/docker.sock',
    '-v', '/home/runner/work/_temp/_github_home:/github/home',
    '-v', '/home/runner/work/_temp/_github_workflow:/github/workflow',
    '-v', process.env.GITHUB_WORKSPACE + ':/github/workspace', '-i',
    'bilelmoussaoui/flatpak-github-actions:wip']

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


/***/ }),

/***/ 739:
/***/ (function(module) {

module.exports = eval("require")("@actions/core");


/***/ })

/******/ });