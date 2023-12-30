kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
- freedesktop-sdk.bst:components/python3-hatch-vcs.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: pypi
  name: referencing
  ref:
    sha256sum: 689e64fe121843dcfd57b71933318ef1f91188ffb45367332700a86ac8fd6161
    suffix: 96/71/0aabc36753b7f4ad18cbc3c97dea9d6a4f204cbba7b8e9804313366e1c8f/referencing-0.32.0.tar.gz
