kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
- freedesktop-sdk.bst:components/python3-hatch-vcs.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: pypi
  name: jsonschema-specifications
  ref:
    sha256sum: 48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc
    suffix: f8/b9/cc0cc592e7c195fb8a650c1d5990b10175cf13b4c97465c72ec841de9e4b/jsonschema_specifications-2023.12.1.tar.gz
