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
