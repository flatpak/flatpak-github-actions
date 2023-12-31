kind: manual

build-depends:
- freedesktop-sdk.bst:components/util-linux.bst

config:
  configure-commands:
  - |
    sed -i 's|${qemu_target_list}|"aarch64"|g' src/scripts/qemu-binfmt-conf.sh

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" qemu-aarch64
  - |
    mkdir -p %{install-root}%{datadir}/binfmts
    src/scripts/qemu-binfmt-conf.sh --debian --exportdir "%{install-root}%{datadir}/binfmts" --qemu-path "%{bindir}" --persistent yes --preserve-argv0 yes

  strip-commands:
  - true

sources:
- kind: tar
  base-dir: ''
  url: 
    github_files:tonistiigi/binfmt/releases/download/deploy%2Fv8.0.4-33/qemu_v8.0.4_linux-amd64.tar.gz
  ref: 924cd873807a87d800ea914a7d4b1d81973e935839e9596cf4ff7183290b4572
- kind: tar
  directory: src
  url: qemu:qemu-8.0.4.tar.xz
  ref: 81c817dda38af958be5bef1a6cf55b658bb2d3fb87c1e6a571de6b7b2c44516c
