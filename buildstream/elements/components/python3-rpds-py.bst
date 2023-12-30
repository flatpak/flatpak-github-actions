kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- components/python3-maturin.bst

depends:
- freedesktop-sdk.bst:components/python3.bst

sources:
- kind: pypi
  name: rpds-py
  ref:
    sha256sum: 781ef8bfc091b19960fc0142a23aedadafa826bc32b433fdfe6fd7f964d7ef44
    suffix: 
      c2/63/94a1e9406b34888bdf8506e91d654f1cd84365a5edafa5f8ff0c97d4d9e1/rpds_py-0.16.2.tar.gz
- kind: cargo
  url: crates:crates
  ref:
  - name: archery
    version: 1.1.0
    sha: 487955f60962765486ce000015a3492ca45c34a2ebbf12bc0aa2b5110ca6e7d2
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: indoc
    version: 2.0.4
    sha: 1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8
  - name: libc
    version: 0.2.147
    sha: b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3
  - name: lock_api
    version: 0.4.10
    sha: c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16
  - name: memoffset
    version: 0.9.0
    sha: 5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c
  - name: once_cell
    version: 1.18.0
    sha: dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d
  - name: parking_lot
    version: 0.12.1
    sha: 3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f
  - name: parking_lot_core
    version: 0.9.8
    sha: 93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447
  - name: proc-macro2
    version: 1.0.66
    sha: 18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9
  - name: pyo3
    version: 0.20.0
    sha: 04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b
  - name: pyo3-build-config
    version: 0.20.0
    sha: a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5
  - name: pyo3-ffi
    version: 0.20.0
    sha: 214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b
  - name: pyo3-macros
    version: 0.20.0
    sha: dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b
  - name: pyo3-macros-backend
    version: 0.20.0
    sha: 7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424
  - name: quote
    version: 1.0.31
    sha: 5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0
  - name: redox_syscall
    version: 0.3.5
    sha: 567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29
  - name: rpds
    version: 1.1.0
    sha: a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: smallvec
    version: 1.11.0
    sha: 62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9
  - name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - name: syn
    version: 2.0.32
    sha: 239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2
  - name: target-lexicon
    version: 0.12.9
    sha: df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0
  - name: triomphe
    version: 0.1.9
    sha: 0eee8098afad3fb0c54a9007aab6804558410503ad676d4633f9c2559a00ac0f
  - name: unicode-ident
    version: 1.0.11
    sha: 301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c
  - name: unindent
    version: 0.2.3
    sha: c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce
  - name: windows-targets
    version: 0.48.1
    sha: 05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f
  - name: windows_aarch64_gnullvm
    version: 0.48.0
    sha: 91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc
  - name: windows_aarch64_msvc
    version: 0.48.0
    sha: b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3
  - name: windows_i686_gnu
    version: 0.48.0
    sha: 622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241
  - name: windows_i686_msvc
    version: 0.48.0
    sha: 4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00
  - name: windows_x86_64_gnu
    version: 0.48.0
    sha: ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1
  - name: windows_x86_64_gnullvm
    version: 0.48.0
    sha: 7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953
  - name: windows_x86_64_msvc
    version: 0.48.0
    sha: 1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a
