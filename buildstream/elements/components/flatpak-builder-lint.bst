kind: manual

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-poetry.bst
- freedesktop-sdk.bst:components/python3-pip.bst

depends:
- freedesktop-sdk.bst:components/python3-lxml.bst
- freedesktop-sdk.bst:components/python3-requests.bst
- components/python3-jsonschema.bst
- components/python3-sentry-sdk.bst

runtime-depends:
- freedesktop-sdk.bst:components/desktop-file-utils.bst

config:
  install-commands:
  - pip install --root=%{install-root} --prefix=%{prefix} . --no-build-isolation

sources:
- kind: git_tag
  url: github:flathub-infra/flatpak-builder-lint.git
  track: master
  track-tags: True
  ref: v2.1.5-0-g3bbf1fef98e0a419d97f927a992187ff6d725402
