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

# Based on https://gitlab.gnome.org/GNOME/citemplates/raw/master/flatpak/flatpak_ci_initiative.yml
flatpak-builder --user --disable-rofiles-fuse --stop-at="${FLATPAK_MODULE}" flatpak_app ${MANIFEST_PATH}

flatpak build flatpak_app meson --prefix=/app ${MESON_ARGS} _build
flatpak build flatpak_app ninja -C _build install

flatpak build flatpak_app bash -C \
"for lang in \$(ls /app/share/locale)
do
  ll=\$(echo \${lang} | egrep -o '^[a-z]+')
  test \${ll} == en && continue
  test -L /app/share/locale/\${lang} && continue
  mkdir -p /app/share/runtime/locale/\${ll}/share
  mv /app/share/locale/\${lang} /app/share/runtime/locale/\${ll}/share
  ln -s ../../share/runtime/locale/\${ll}/share/\${lang} /app/share/locale
done"

flatpak build flatpak_app bash -c \
"find /app -type f '(' -perm -111 -o -name '*.so*' ')' -print0 | while read -r -d $'\\0' file
do
  read -n4 hdr < \${file} || continue
  if [ \"\$hdr\" != \$(printf \\\\x7fELF) ]
  then
    continue
  fi
  if objdump -j .gnu_debuglink -s \${file} &> /dev/null
  then
    continue
  fi
  case \${file} in /app/lib/debug/*)
    continue ;;
  esac
  debugedit -i --list-file=source-files.part --base-dir=\${PWD} --dest-dir=/app/lib/debug/source/${FLATPAK_MODULE} \${file} &> /dev/null
  cat source-files.part >> source-files
  realpath=\$(realpath -s --relative-to=/app \${file})
  debugfile=/app/lib/debug/\${realpath}.debug
  mkdir -p \$(dirname \${debugfile})
  objcopy --only-keep-debug --compress-debug-sections \${file} \${debugfile}
  chmod 644 \${debugfile}
  mode=\$(stat -c 0%a \${file})
  [ -w \${file} ] || chmod +w \${file}
  strip --remove-section=.comment --remove-section=.note --strip-unneeded --remove-section=.gnu_debugaltlink \${file}
  objcopy --add-gnu-debuglink \${debugfile} \${file}
  chmod \${mode} \${file}
done
sort -zu < source-files | while read -r -d \$'\\0' source
do
  dst=/app/lib/debug/source/${FLATPAK_MODULE}/\${source}
  src=\${source}
  if [ -d \${src} ]
  then
    install -m0755 -d \${dst}
    continue
  fi
  [ -f \${src} ] || continue
  install -m0644 -D \${src} \${dst}
done"

flatpak-builder --user --disable-rofiles-fuse --finish-only --repo=repo ${BRANCH:+--default-branch=$BRANCH} \
  flatpak_app "${MANIFEST_PATH}"

xvfb-run -a -s "-screen 0 1024x768x24" \
  flatpak build \
  --env=LANG=C.UTF-8 \
  --env=NO_AT_BRIDGE=1 \
  ${TEST_BUILD_ARGS} \
  flatpak_app \
  dbus-run-session \
  meson test -C _build --no-stdsplit --print-errorlogs ${TEST_RUN_ARGS}

flatpak build-bundle repo "${BUNDLE}" --runtime-repo="${RUNTIME_REPO}" ${APP_ID} ${BRANCH}
tar cf repo.tar repo/
