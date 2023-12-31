kind: stack

depends:
- extra-fs.bst
- freedesktop-sdk.bst:sdk.bst
- freedesktop-sdk.bst:components/flatpak.bst
- components/flatpak-builder.bst
- freedesktop-sdk.bst:components/flat-manager-client.bst
- freedesktop-sdk.bst:components/ccache.bst
- freedesktop-sdk.bst:components/appstream-glib.bst
- gnome-build-meta.bst:vm/git-lfs.bst
- gnome-build-meta.bst:core-deps/xvfb.bst
- components/flatpak-builder-lint.bst
- components/gh-cli.bst
- gnome-build-meta.bst:vm/flathub-config.bst
- flatpakrepo/flathub-beta.bst
- gnome-build-meta.bst:vm/gnome-nightly-config.bst
