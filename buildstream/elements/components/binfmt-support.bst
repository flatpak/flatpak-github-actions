kind: autotools

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- freedesktop-sdk.bst:components/libpipeline.bst

variables:
  conf-local: >-
    --disable-upstart

sources:
- kind: tar
  url: https://download.savannah.nongnu.org/releases/binfmt-support/binfmt-support-2.2.2.tar.gz
  ref: cce14163f9b526283e6f0d00f3be1cfe239fa2c7574e5e0ba8ad3db74166a4a5
