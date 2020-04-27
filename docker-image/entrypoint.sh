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
      APP_ID="$2"
      shift
      shift
    ;;
  esac
done

# Based on https://gitlab.gnome.org/GNOME/citemplates/raw/master/flatpak/flatpak_ci_initiative.yml
rewrite-flatpak-manifest "${MANIFEST_PATH}" "${FLATPAK_MODULE}"
flatpak-builder --user flatpak_app --repo=repo "${BRANCH:+--default-branch=$BRANCH}" "${MANIFEST_PATH}"

flatpak build-bundle repo "${BUNDLE}" --runtime-repo="${RUNTIME_REPO}" "${APP_ID}" "${BRANCH}"
tar cf repo.tar repo/

rm -rf flatpak_app
flatpak-builder --user --build-only flatpak_app "${MANIFEST_PATH}"
flatpak build-finish --socket=x11 flatpak_app

xvfb-run -a -s "-screen 0 1024x768x24" \
flatpak-builder --user --build-shell="${FLATPAK_MODULE}" flatpak_app "${MANIFEST_PATH}" \
"LANG=C.UTF-8 \\
NO_AT_BRIDGE=1 \\
dbus-run-session \\
meson test --no-stdsplit --print-errorlogs ${TEST_RUN_ARGS}"
