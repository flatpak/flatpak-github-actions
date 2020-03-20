#!/bin/bash
set -e
# Arguments Parser
BUNDLE="app.flatpak"
RUNTIME_REPO="https://flathub.org/repo/flathub.flatpakrepo"

while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    --manifest-path)
      MANIFEST_PATH="$2"
      shift
      shift
    ;;
    --meson-args)
      MESON_ARGS="$2"
      shift
      shift
    ;;
    --flatpak-module)
      FLATPAK_MODULE="$2"
      shift
      shift
    ;;
    --bundle)
      BUNDLE="$2"
      shift
      shift
    ;;
    --runtime-repo)
      RUNTIME_REPO="$2"
      shift
      shift
    ;;
    --app-id)
      export APP_ID="$2"
      shift
      shift
    ;;
  esac
done


flatpak-builder --repo=repo --force-clean flatpak_app ${MANIFEST_PATH} --install-deps-from=flathub
flatpak build-bundle repo ${BUNDLE} --runtime-repo=${RUNTIME_REPO} ${APP_ID} master