kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
- freedesktop-sdk.bst:components/python3-hatch-fancy-pypi-readme.bst
- freedesktop-sdk.bst:components/python3-hatch-vcs.bst

depends:
- freedesktop-sdk.bst:components/python3-attrs.bst
- components/python3-jsonschema-specifications.bst
- components/python3-referencing.bst
- components/python3-rpds-py.bst

sources:
- kind: pypi
  name: jsonschema
  ref:
    sha256sum: 4f614fd46d8d61258610998997743ec5492a648b33cf478c1ddc23ed4598a5fa
    suffix: a8/74/77bf12d3dd32b764692a71d4200f03429c41eee2e8a9225d344d91c03aff/jsonschema-4.20.0.tar.gz
