kind: meson

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst

depends:
- freedesktop-sdk.bst:bootstrap-import.bst
- freedesktop-sdk.bst:components/curl.bst
- freedesktop-sdk.bst:components/flatpak.bst
- freedesktop-sdk.bst:components/fuse3.bst
- freedesktop-sdk.bst:components/json-glib.bst
- freedesktop-sdk.bst:components/libsoup.bst
- freedesktop-sdk.bst:components/libyaml.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/xmlto.bst

runtime-depends:
- freedesktop-sdk.bst:components/git.bst
- freedesktop-sdk.bst:components/tar.bst
- freedesktop-sdk.bst:components/gzip.bst
- freedesktop-sdk.bst:components/zip.bst

variables:
  meson-local: >-
    -Dtests=false
    -Dfuse=3

sources:
- kind: git_repo
  url: github:flatpak/flatpak-builder.git
  # Stuck on 1.3.3, until the action is ready for 1.4
  ref: 1.3.3-0-ga4d9dbc3ab3f339ee0be58e7ae7baa2b0fc721bc
- kind: git_module
  path: subprojects/libglnx
  url: gnome:libglnx.git
  ref: 07e3e49d3e47dfd4265ffb5495111439131715ca
