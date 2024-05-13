kind: script

build-depends:
- freedesktop-sdk.bst:oci/oci-builder.bst
- oci/layers/tooling-init-scripts.bst
- filename: freedesktop-sdk.bst:oci/sdk-oci.bst
  config:
   location: /parent
- filename: oci/layers/tooling.bst
  config:
   location: /layer

config:
 commands:
 - |
   if [ -d /initial_scripts ]; then
     for i in /initial_scripts/*; do
       "${i}" /layer
     done
   fi
 
 - |
   cd "%{install-root}"
   build-oci <<EOF
   mode: docker
   images:
   - os: linux
     architecture: 'amd64'
     parent:
      image: /parent
     layer: /layer
     comment: "Import tooling layer from flatpak-github-actions"
     tags:
     - "ghcr.io/flatpak/flatpak-github-actions:base-x86_64"
   EOF
