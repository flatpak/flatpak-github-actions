kind: junction

sources:
- kind: git_tag
  url: gnome:gnome-build-meta.git
  track: gnome-45
  track-tags: True
  ref: 45.3-0-g173e1b90e6801732b885b84e4727c60dbdd964df

config:
  options:
    arch: 'x86_64'

  overrides:
    freedesktop-sdk.bst: freedesktop-sdk.bst
    plugins/bst-plugins-experimental.bst: plugins/bst-plugins-experimental.bst
    plugins/buildstream-plugins.bst: plugins/buildstream-plugins.bst
