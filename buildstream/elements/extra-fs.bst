kind: script

build-depends:
- freedesktop-sdk.bst:bootstrap-import.bst

config:
  commands:
  - |
    mkdir -p "%{install-root}/tmp"
    mkdir -p "%{install-root}/var/tmp"
    mkdir -p "%{install-root}/sys"
    mkdir -p "%{install-root}/dev"
    mkdir -p "%{install-root}/proc"
    mkdir -p "%{install-root}/etc"
    mkdir -p "%{install-root}/root"

  - |
    cat <<EOF >"%{install-root}/etc/passwd"
    root:x:0:0:root:/root:/bin/bash
    EOF

  - |
    cat <<EOF >"%{install-root}/etc/group"
    root:x:0:
    EOF

public:
  initial-script:
    script: |
      #!/bin/sh
      sysroot="${1}"
      chmod 1777 ${sysroot}/tmp
      chmod 1777 ${sysroot}/var/tmp
