kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: pypi
  name: sentry-sdk
  ref:
    sha256sum: 320a55cdf9da9097a0bead239c35b7e61f53660ef9878861824fd6d9b2eaf3b5
    suffix: 6b/0e/f5f91a3e1c62e84579bdd0f14d937d50c0d2aa201ec4203f80565e5a5c9b/sentry-sdk-1.39.1.tar.gz
