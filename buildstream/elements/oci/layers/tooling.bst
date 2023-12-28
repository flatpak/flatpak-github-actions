kind: compose

build-depends:
- tooling.bst
- freedesktop-sdk.bst:components/os-release.bst

config:
 exclude:
 - debug
 - doc
 - locale
 - extra
 - static-blocklist
 - vm-only
