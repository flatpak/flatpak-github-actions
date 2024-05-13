kind: manual

depends:
- freedesktop-sdk.bst:bootstrap-import.bst

config:
 install-commands:
 - |
   install -Dm755 -t "%{install-root}%{bindir}" bin/gh

sources:
- kind: tar
  url: github_files:cli/cli/releases/download/v2.40.1/gh_2.40.1_linux_amd64.tar.gz
  ref: 7f34ee83a7dd17addd1d029bc66ec06d91773a93172e3e1e30e0ec3a9f923fe2
