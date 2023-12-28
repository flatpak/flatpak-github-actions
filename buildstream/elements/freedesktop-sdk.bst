kind: junction

sources:
- kind: git_tag
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/23.08
  track-tags: True
  ref: freedesktop-sdk-23.08.9-0-gf77cdbfd69eeea5b8c528a66410b98a786937513

config:
  options:
    target_arch: 'x86_64'
    bootstrap_build_arch: 'x86_64'
