kind: pyproject

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:components/python3-setuptools-rust.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/rust.bst

sources:
- kind: pypi
  name: maturin
  ref:
    sha256sum: ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378bf93790
    suffix: 
      20/90/43a3aa35f037e91582ec7516a92084a71f84e89e39ef580813bed072b154/maturin-1.4.0.tar.gz
- kind: cargo
  url: crates:crates
  ref:
  - name: adler
    version: 1.0.2
    sha: f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe
  - name: ahash
    version: 0.8.6
    sha: 91429305e9f0a25f6205c5b8e0d2db09e0708a7a6df0f42212bb56c32c8ac97a
  - name: aho-corasick
    version: 1.1.2
    sha: b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0
  - name: allocator-api2
    version: 0.2.16
    sha: 0942ffc6dcaadf03badf6e6a2d0228460359d5e34b57ccdc720b7382dfbd5ec5
  - name: anstream
    version: 0.3.2
    sha: 0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163
  - name: anstream
    version: 0.6.4
    sha: 2ab91ebe16eb252986481c5b62f6098f3b698a45e34b5b98200cf20dd2484a44
  - name: anstyle
    version: 1.0.2
    sha: 15c4c2c83f81532e5845a733998b6971faca23490340a418e9b72a3ec9de12ea
  - name: anstyle-parse
    version: 0.2.1
    sha: 938874ff5980b03a87c5524b3ae5b59cf99b1d6bc836848df7bc5ada9643c333
  - name: anstyle-query
    version: 1.0.0
    sha: 5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b
  - name: anstyle-wincon
    version: 1.0.2
    sha: c677ab05e09154296dd37acecd46420c17b9713e8366facafa8fc0885167cf4c
  - name: anstyle-wincon
    version: 3.0.1
    sha: f0699d10d2f4d628a98ee7b57b289abbc98ff3bad977cb3152709d4bf2330628
  - name: anyhow
    version: 1.0.75
    sha: a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: base64
    version: 0.13.1
    sha: 9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8
  - name: base64
    version: 0.21.5
    sha: 35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bitflags
    version: 2.4.1
    sha: 327762f6e5a765692301e5bb513e0d9fef63be86bbc14528052b1cd3e6f03e07
  - name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - name: bstr
    version: 1.8.0
    sha: 542f33a8835a0884b006a0c3df3dadd99c0c3f296ed26c2fdc8028e01ad6230c
  - name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - name: bytes
    version: 1.5.0
    sha: a2bd12c1caf447e69cd4528f47f94d203fd2582878ecb9e9465484c4148a8223
  - name: bytesize
    version: 1.3.0
    sha: a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc
  - name: bzip2
    version: 0.4.4
    sha: bdb116a6ef3f6c3698828873ad02c3014b3c85cadb88496095628e3ef1e347f8
  - name: bzip2-sys
    version: 0.1.11+1.0.8
    sha: 736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a186b6cd4cdc
  - name: cab
    version: 0.4.1
    sha: ae6b4de23c7d39c0631fd3cc952d87951c86c75a13812d7247cb7a896e7b3551
  - name: camino
    version: 1.1.6
    sha: c59e92b5a388f549b863a7bea62612c09f24c8393560709a54558a9abdfb3b9c
  - name: cargo-config2
    version: 0.1.16
    sha: 7f387366785e82c7ec7ef5b845a7f61324fbf5d467d6a878469eac30c1c44b1b
  - name: cargo-options
    version: 0.7.2
    sha: cad71bf996c8e5b9d28ef3472d7ee41f277edf4e38cd597f51ad0438d05d76ea
  - name: cargo-platform
    version: 0.1.5
    sha: e34637b3140142bdf929fb439e8aa4ebad7651ebf7b1080b3930aa16ac1459ff
  - name: cargo-xwin
    version: 0.16.2
    sha: 02bb6bf59526935e47445f959a19c2168f151284dbf7e57f5577934334e9a61d
  - name: cargo-zigbuild
    version: 0.18.0
    sha: edc9c2fe646a29983b5f7263bd789175f2aaad7ea42525affa40e2172be93286
  - name: cargo_metadata
    version: 0.18.1
    sha: 2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037
  - name: cbindgen
    version: 0.26.0
    sha: da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49
  - name: cc
    version: 1.0.83
    sha: f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0
  - name: cfb
    version: 0.9.0
    sha: b390793e912300f1aa713429f7fd0c391024e6c18b988962558bc4f96a349b1f
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: charset
    version: 0.1.3
    sha: 18e9079d1a12a2cc2bffb5db039c43661836ead4082120d5844f02555aca2d46
  - name: chumsky
    version: 0.9.3
    sha: 8eebd66744a15ded14960ab4ccdbfb51ad3b81f51f3f04a80adac98c985396c9
  - name: clap
    version: 4.3.24
    sha: fb690e81c7840c0d7aade59f242ea3b41b9bc27bcd5997890e7702ae4b32e487
  - name: clap_builder
    version: 4.3.24
    sha: 5ed2e96bc16d8d740f6f48d663eddf4b8a0983e79210fd55479b7bcd0a69860e
  - name: clap_complete
    version: 4.3.2
    sha: 5fc443334c81a804575546c5a8a79b4913b50e28d69232903604cada1de817ce
  - name: clap_complete_command
    version: 0.5.1
    sha: 183495371ea78d4c9ff638bfc6497d46fed2396e4f9c50aebc1278a4a9919a3d
  - name: clap_complete_fig
    version: 4.3.1
    sha: 99fee1d30a51305a6c2ed3fc5709be3c8af626c9c958e04dd9ae94e27bcbce9f
  - name: clap_complete_nushell
    version: 0.1.11
    sha: 5d02bc8b1a18ee47c4d2eec3fb5ac034dc68ebea6125b1509e9ccdffcddce66e
  - name: clap_derive
    version: 4.3.12
    sha: 54a9bb5758fc5dfe728d1019941681eccaf0cf8a4189b692a0ee2f2ecf90a050
  - name: clap_lex
    version: 0.5.0
    sha: 2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b
  - name: cli-table
    version: 0.4.7
    sha: adfbb116d9e2c4be7011360d0c0bee565712c11e969c9609b25b619366dc379d
  - name: colorchoice
    version: 1.0.0
    sha: acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7
  - name: configparser
    version: 3.0.3
    sha: e0e56e414a2a52ab2a104f85cd40933c2fbc278b83637facf646ecf451b49237
  - name: console
    version: 0.15.7
    sha: c926e00cc70edefdc64d3a5ff31cc65bb97a3460097762bd23afb4d8145fccf8
  - name: content_inspector
    version: 0.2.4
    sha: b7bda66e858c683005a53a9a60c69a4aca7eeaa45d124526e389f7aec8e62f38
  - name: core-foundation
    version: 0.9.3
    sha: 194a7a9e6de53fa55116934067c844d9d749312f75c6f6d0980e8c252f8c2146
  - name: core-foundation-sys
    version: 0.8.4
    sha: e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa
  - name: cpufeatures
    version: 0.2.11
    sha: ce420fe07aecd3e67c5f910618fe65e94158f6dcc0adf44e00d69ce2bdfe0fd0
  - name: crc32fast
    version: 1.3.2
    sha: b540bd8bc810d3885c6ea91e2018302f68baba2129ab3e88f32389ee9370880d
  - name: crossbeam-channel
    version: 0.5.8
    sha: a33c2bf77f2df06183c3aa30d1e96c0695a313d4f9c453cc3762a6db39f99200
  - name: crossbeam-deque
    version: 0.8.3
    sha: ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef
  - name: crossbeam-epoch
    version: 0.9.15
    sha: ae211234986c545741a7dc064309f67ee1e5ad243d0e48335adc0484d960bcc7
  - name: crossbeam-utils
    version: 0.8.16
    sha: 5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294
  - name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - name: data-encoding
    version: 2.5.0
    sha: 7e962a19be5cfc3f3bf6dd8f61eb50107f356ad6270fbb3ed41476571db78be5
  - name: deranged
    version: 0.3.9
    sha: 0f32d04922c60427da6f9fef14d042d9edddef64cb9d4ce0d64d0685fbeb1fd3
  - name: dialoguer
    version: 0.11.0
    sha: 658bce805d770f407bc62102fca7c2c64ceef2fbcb2b8bd19d2765ce093980de
  - name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - name: dirs
    version: 5.0.1
    sha: 44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225
  - name: dirs-sys
    version: 0.4.1
    sha: 520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c
  - name: dissimilar
    version: 1.0.7
    sha: 86e3bdc80eee6e16b2b6b0f87fbc98c04bee3455e35174c0de1a125d0688c632
  - name: dunce
    version: 1.0.4
    sha: 56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b
  - name: either
    version: 1.9.0
    sha: a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07
  - name: encode_unicode
    version: 0.3.6
    sha: a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f
  - name: encoding_rs
    version: 0.8.33
    sha: 7268b386296a025e474d5140678f75d6de9493ae55a5d709eeb9dd08149945e1
  - name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - name: errno
    version: 0.3.8
    sha: a258e46cdc063eb8519c00b9fc845fc47bcfca4130e2f08e88665ceda8474245
  - name: expect-test
    version: 1.4.1
    sha: 30d9eafeadd538e68fb28016364c9732d78e420b9ff8853fa5e4058861e9f8d3
  - name: fastrand
    version: 2.0.1
    sha: 25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5
  - name: fat-macho
    version: 0.4.7
    sha: 63fa117c7dcabeb8c83d5c229764cfa46518545d2dba5a9a08912014711f997b
  - name: filetime
    version: 0.2.22
    sha: d4029edd3e734da6fe05b6cd7bd2960760a616bd2ddd0d59a0124746d6272af0
  - name: flate2
    version: 1.0.28
    sha: 46303f565772937ffe1d394a4fac6f411c6013172fadde9dcdb1e147a086940e
  - name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - name: foreign-types
    version: 0.3.2
    sha: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
  - name: foreign-types-shared
    version: 0.1.1
    sha: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
  - name: form_urlencoded
    version: 1.2.1
    sha: e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456
  - name: fs-err
    version: 2.11.0
    sha: 88a41f105fe1d5b6b34b2055e3dc59bb79b46b48b2040b9e6c7b4b5de097aa41
  - name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - name: getrandom
    version: 0.2.11
    sha: fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f
  - name: glob
    version: 0.3.1
    sha: d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b
  - name: globset
    version: 0.4.14
    sha: 57da3b9b5b85bd66f31093f8c408b90a74431672542466497dcbdfdc02034be1
  - name: goblin
    version: 0.7.1
    sha: f27c1b4369c2cd341b5de549380158b105a04c331be5db9110eef7b6d2742134
  - name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - name: hashbrown
    version: 0.14.3
    sha: 290f1a1d9242c78d09ce40a5e87e7554ee637af1351968159f4952f028f75604
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: hermit-abi
    version: 0.3.3
    sha: d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7
  - name: home
    version: 0.5.5
    sha: 5444c27eef6923071f7ebcc33e3444508466a76f7a2b93da00ed6e19f30c1ddb
  - name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - name: humantime-serde
    version: 1.1.1
    sha: 57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c
  - name: idna
    version: 0.5.0
    sha: 634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6
  - name: ignore
    version: 0.4.20
    sha: dbe7873dab538a9a44ad79ede1faf5f30d49f9a5c883ddbab48bce81b64b7492
  - name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - name: indexmap
    version: 2.1.0
    sha: d530e1a18b1cb4c484e6e34556a0d948706958449fca0cab753d649f2bce3d1f
  - name: indicatif
    version: 0.17.7
    sha: fb28741c9db9a713d93deb3bb9515c20788cef5815265bee4980e87bde7e0f25
  - name: indoc
    version: 2.0.4
    sha: 1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8
  - name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - name: io-lifetimes
    version: 1.0.11
    sha: eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2
  - name: is-terminal
    version: 0.4.9
    sha: cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b
  - name: itertools
    version: 0.11.0
    sha: b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57
  - name: itertools
    version: 0.12.0
    sha: 25db6b064527c5d482d0423354fcd07a89a2dfe07b67892e62411946db7f07b0
  - name: itoa
    version: 1.0.9
    sha: af150ab688ff2122fcef229be89cb50dd66af9e01a4ff320cc137eecc9bacc38
  - name: keyring
    version: 2.0.5
    sha: 9549a129bd08149e0a71b2d1ce2729780d47127991bfd0a78cc1df697ec72492
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: lddtree
    version: 0.3.3
    sha: 2f5bfec46830ad3a95199ae6804dfe9f51fdad43d7a95fbb6c185efa9824c295
  - name: libc
    version: 0.2.150
    sha: 89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c
  - name: libredox
    version: 0.0.1
    sha: 85c833ca1e66078851dba29046874e38f08b2c883700aa29a03ddd3b23814ee8
  - name: linux-keyutils
    version: 0.2.3
    sha: 3f27bb67f6dd1d0bb5ab582868e4f65052e58da6401188a08f0da09cf512b84b
  - name: linux-raw-sys
    version: 0.3.8
    sha: ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519
  - name: linux-raw-sys
    version: 0.4.11
    sha: 969488b55f8ac402214f3f5fd243ebb7206cf82de60d3172994707a4bcc2b829
  - name: lock_api
    version: 0.4.11
    sha: 3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45
  - name: log
    version: 0.4.20
    sha: b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f
  - name: lzxd
    version: 0.1.4
    sha: 784462f20dddd9dfdb45de963fa4ad4a288cb10a7889ac5d2c34fb6481c6b213
  - name: mailparse
    version: 0.14.0
    sha: 6b56570f5f8c0047260d1c8b5b331f62eb9c660b9dd4071a8c46f8c7d3f280aa
  - name: matchers
    version: 0.1.0
    sha: 8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558
  - name: memchr
    version: 2.6.4
    sha: f665ee40bc4a3c5590afb1e9677db74a508659dfd71e126420da8274909a0167
  - name: memoffset
    version: 0.9.0
    sha: 5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c
  - name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - name: mime_guess
    version: 2.0.4
    sha: 4192263c238a5f0d0c6bfd21f336a313a4ce1c450542449ca191bb657b4642ef
  - name: minijinja
    version: 1.0.10
    sha: 208758577ef2c86cf5dd3e85730d161413ec3284e2d73b2ef65d9a24d9971bcb
  - name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - name: miniz_oxide
    version: 0.7.1
    sha: e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7
  - name: msi
    version: 0.7.0
    sha: 226b2404f03d2cf47375b9715c8adfae4e388bb2377cff908e8a40f31e421514
  - name: multipart
    version: 0.18.0
    sha: 00dec633863867f29cb39df64a397cdf4a6354708ddd7759f70c7fb51c5f9182
  - name: native-tls
    version: 0.2.11
    sha: 07226173c32f2926027b63cce4bcd8076c3552846cbe7925f3aaffeac0a3b92e
  - name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - name: normalize-line-endings
    version: 0.3.0
    sha: 61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be
  - name: normpath
    version: 1.1.1
    sha: ec60c60a693226186f5d6edf073232bfb6464ed97eb22cf3b01c1e8198fd97f5
  - name: nu-ansi-term
    version: 0.46.0
    sha: 77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84
  - name: number_prefix
    version: 0.4.0
    sha: 830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3
  - name: once_cell
    version: 1.18.0
    sha: dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d
  - name: openssl
    version: 0.10.60
    sha: 79a4c6c3a2b158f7f8f2a2fc5a969fa3a068df6fc9dbb4a43845436e3af7c800
  - name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - name: openssl-probe
    version: 0.1.5
    sha: ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf
  - name: openssl-sys
    version: 0.9.96
    sha: 3812c071ba60da8b5677cc12bcb1d42989a65553772897a7e0355545a819838f
  - name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - name: os_pipe
    version: 1.1.4
    sha: 0ae859aa07428ca9a929b936690f8b12dc5f11dd8c6992a18ca93919f28bc177
  - name: overload
    version: 0.1.1
    sha: b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39
  - name: parking_lot
    version: 0.12.1
    sha: 3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f
  - name: parking_lot_core
    version: 0.9.9
    sha: 4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e
  - name: paste
    version: 1.0.14
    sha: de3145af08024dea9fa9914f381a17b8fc6034dfb00f3a84013f7ff43f29ed4c
  - name: path-slash
    version: 0.2.1
    sha: 1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42
  - name: pep440_rs
    version: 0.3.12
    sha: 887f66cc62717ea72caac4f1eb4e6f392224da3ffff3f40ec13ab427802746d6
  - name: pep508_rs
    version: 0.2.3
    sha: e4516b53d9ea6112ebb38b4af08d5707d30b994fb7f98ff133c5dcf7ed8fa854
  - name: percent-encoding
    version: 2.3.1
    sha: e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e
  - name: pin-project-lite
    version: 0.2.13
    sha: 8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58
  - name: pkg-config
    version: 0.3.27
    sha: 26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964
  - name: plain
    version: 0.2.3
    sha: b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6
  - name: platform-info
    version: 2.0.2
    sha: d6259c4860e53bf665016f1b2f46a8859cadfa717581dc9d597ae4069de6300f
  - name: portable-atomic
    version: 1.5.1
    sha: 3bccab0e7fd7cc19f820a1c8c91720af652d0c88dc9664dd72aef2614f04af3b
  - name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - name: pretty_assertions
    version: 1.4.0
    sha: af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66
  - name: proc-macro2
    version: 1.0.70
    sha: 39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b
  - name: psm
    version: 0.1.21
    sha: 5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874
  - name: pyproject-toml
    version: 0.8.1
    sha: 46d4a5e69187f23a29f8aa0ea57491d104ba541bc55f76552c2a74962aa20e04
  - name: python-pkginfo
    version: 0.6.0
    sha: 037469c164f08c891bf6d69ca02f1d56210011451e229618669777df82124cfa
  - name: quote
    version: 1.0.33
    sha: 5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae
  - name: quoted_printable
    version: 0.4.8
    sha: 5a3866219251662ec3b26fc217e3e05bf9c4f84325234dfb96bf0bf840889e49
  - name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - name: rayon
    version: 1.8.0
    sha: 9c27db03db7734835b3f53954b534c91069375ce6ccaa2e065441e07d9b6cdb1
  - name: rayon-core
    version: 1.12.0
    sha: 5ce3fb6ad83f861aac485e76e1985cd109d9a3713802152be56c3b1f0e0658ed
  - name: redox_syscall
    version: 0.3.5
    sha: 567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29
  - name: redox_syscall
    version: 0.4.1
    sha: 4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa
  - name: redox_users
    version: 0.4.4
    sha: a18479200779601e498ada4e8c1e1f50e3ee19deb0259c25825a98b5603b2cb4
  - name: regex
    version: 1.10.2
    sha: 380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343
  - name: regex-automata
    version: 0.1.10
    sha: 6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132
  - name: regex-automata
    version: 0.4.3
    sha: 5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f
  - name: regex-syntax
    version: 0.6.29
    sha: f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1
  - name: regex-syntax
    version: 0.8.2
    sha: c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f
  - name: rfc2047-decoder
    version: 0.2.2
    sha: 61fc4b4e52897c3e30b12b7e9b04461215b647fbe66f6def60dd8edbce14ec2e
  - name: ring
    version: 0.17.6
    sha: 684d5e6e18f669ccebf64a92236bb7db9a34f07be010e3627368182027180866
  - name: rustc_version
    version: 0.4.0
    sha: bfa0f585226d2e68097d4f95d113b15b83a82e819ab25717ec0590d9584ef366
  - name: rustix
    version: 0.37.27
    sha: fea8ca367a3a01fe35e6943c400addf443c0f57670e6ec51196f71a4b8762dd2
  - name: rustix
    version: 0.38.21
    sha: 2b426b0506e5d50a7d8dafcf2e81471400deb602392c7dd110815afb4eaf02a3
  - name: rustls
    version: 0.21.9
    sha: 629648aced5775d558af50b2b4c7b02983a04b312126d45eeead26e7caa498b9
  - name: rustls-pemfile
    version: 2.0.0
    sha: 35e4980fa29e4c4b212ffb3db068a564cbf560e51d3944b7c88bd8bf5bec64f4
  - name: rustls-pki-types
    version: 1.0.0
    sha: eb0a1f9b9efec70d32e6d6aa3e58ebd88c3754ec98dfe9145c63cf54cc829b83
  - name: rustls-webpki
    version: 0.101.7
    sha: 8b6275d1ee7a1cd780b64aca7726599a1dbc893b1e64144529e55c3c2f745765
  - name: rustversion
    version: 1.0.14
    sha: 7ffc183a10b4478d04cbbbfc96d0873219d962dd5accaff2ffbd4ceb7df837f4
  - name: ryu
    version: 1.0.15
    sha: 1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741
  - name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - name: schannel
    version: 0.1.22
    sha: 0c3733bf4cf7ea0880754e19cb5a462007c4a8c1914bff372ccc95b464f1df88
  - name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - name: scroll
    version: 0.11.0
    sha: 04c565b551bafbef4157586fa379538366e4385d42082f255bfd96e4fe8519da
  - name: scroll_derive
    version: 0.11.1
    sha: 1db149f81d46d2deba7cd3c50772474707729550221e69588478ebf9ada425ae
  - name: sct
    version: 0.7.1
    sha: da046153aa2352493d6cb7da4b6e5c0c057d8a1d0a9aa8560baffdd945acd414
  - name: security-framework
    version: 2.9.2
    sha: 05b64fb303737d99b81884b2c63433e9ae28abebe5eb5045dcdd175dc2ecf4de
  - name: security-framework-sys
    version: 2.9.1
    sha: e932934257d3b408ed8f30db49d85ea163bfe74961f017f405b025af298f0c7a
  - name: semver
    version: 1.0.20
    sha: 836fa6a3e1e547f9a2c4040802ec865b5d85f4014efe00555d7090a3dcaa1090
  - name: serde
    version: 1.0.193
    sha: 25dd9975e68d0cb5aa1120c288333fc98731bd1dd12f561e468ea4728c042b89
  - name: serde_derive
    version: 1.0.193
    sha: 43576ca501357b9b071ac53cdc7da8ef0cbd9493d8df094cd821777ea6e894d3
  - name: serde_json
    version: 1.0.108
    sha: 3d1c7e3eac408d115102c4c24ad393e0821bb3a5df4d506a80f85f7a742a526b
  - name: serde_spanned
    version: 0.6.4
    sha: 12022b835073e5b11e90a14f86838ceb1c8fb0325b72416845c487ac0fa95e80
  - name: sha2
    version: 0.10.8
    sha: 793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8
  - name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - name: shell-words
    version: 1.1.0
    sha: 24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde
  - name: shlex
    version: 1.2.0
    sha: a7cee0529a6d40f580e7a5e6c495c8fbfe21b7b52795ed4bb5e62cdf92bc6380
  - name: similar
    version: 2.3.0
    sha: 2aeaf503862c419d66959f5d7ca015337d864e9c49485d771b732e2a20453597
  - name: smallvec
    version: 1.11.2
    sha: 4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970
  - name: smawk
    version: 0.3.2
    sha: b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c
  - name: snapbox
    version: 0.4.14
    sha: 4b377c0b6e4715c116473d8e40d51e3fa5b0a2297ca9b2a931ba800667b259ed
  - name: snapbox-macros
    version: 0.3.6
    sha: ed1559baff8a696add3322b9be3e940d433e7bb4e38d79017205fd37ff28b28e
  - name: socks
    version: 0.3.4
    sha: f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b
  - name: spin
    version: 0.9.8
    sha: 6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67
  - name: stacker
    version: 0.1.15
    sha: c886bd4480155fd3ef527d45e9ac8dd7118a898a46530b7b94c3e21866259fce
  - name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - name: syn
    version: 2.0.39
    sha: 23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a
  - name: tar
    version: 0.4.40
    sha: b16afcea1f22891c49a00c751c7b63b2233284064f11a200fc624137c51e2ddb
  - name: target-lexicon
    version: 0.12.12
    sha: 14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a
  - name: tempfile
    version: 3.8.1
    sha: 7ef1adac450ad7f4b3c28589471ade84f25f731a7a0fe30d71dfa9f60fd808e5
  - name: termcolor
    version: 1.4.0
    sha: ff1bc3d3f05aff0403e8ac0d92ced918ec05b666a43f83297ccef5bea8a3d449
  - name: terminal_size
    version: 0.2.6
    sha: 8e6bf6f19e9f8ed8d4048dc22981458ebcf406d67e94cd422e5ecd73d63b3237
  - name: textwrap
    version: 0.16.0
    sha: 222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d
  - name: thiserror
    version: 1.0.50
    sha: f9a7210f5c9a7156bb50aa36aed4c95afb51df0df00713949448cf9e97d382d2
  - name: thiserror-impl
    version: 1.0.50
    sha: 266b2e40bc00e5a6c09c3584011e08b06f123c00362c92b975ba9843aaaa14b8
  - name: thread_local
    version: 1.1.7
    sha: 3fdd6f064ccff2d6567adcb3873ca630700f00b5ad3f060c25b5dcfd9a4ce152
  - name: time
    version: 0.3.30
    sha: c4a34ab300f2dee6e562c10a046fc05e358b29f9bf92277f30c3c8d82275f6f5
  - name: time-core
    version: 0.1.2
    sha: ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3
  - name: time-macros
    version: 0.2.15
    sha: 4ad70d68dba9e1f8aceda7aa6711965dfec1cac869f311a51bd08b3a2ccbce20
  - name: tinyvec
    version: 1.6.0
    sha: 87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50
  - name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - name: toml
    version: 0.8.8
    sha: a1a195ec8c9da26928f773888e0742ca3ca1040c6cd859c919c9f59c1954ab35
  - name: toml_datetime
    version: 0.6.5
    sha: 3550f4e9685620ac18a50ed434eb3aec30db8ba93b0287467bca5826ea25baf1
  - name: toml_edit
    version: 0.20.7
    sha: 70f427fce4d84c72b5b732388bf4a9f4531b53f74e2887e3ecb2481f68f66d81
  - name: toml_edit
    version: 0.21.0
    sha: d34d383cd00a163b4a5b85053df514d45bc330f6de7737edfe0a93311d1eaa03
  - name: tracing
    version: 0.1.40
    sha: c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef
  - name: tracing-attributes
    version: 0.1.27
    sha: 34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7
  - name: tracing-core
    version: 0.1.32
    sha: c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54
  - name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - name: tracing-serde
    version: 0.1.3
    sha: bc6b213177105856957181934e4920de57730fc69bf42c37ee5bb664d406d9e1
  - name: tracing-subscriber
    version: 0.3.18
    sha: ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b
  - name: trycmd
    version: 0.14.19
    sha: ed009372a42fb103e6f8767b9222925485e03cca032b700d203e2c5b67bee4fb
  - name: twox-hash
    version: 1.6.3
    sha: 97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675
  - name: typenum
    version: 1.17.0
    sha: 42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825
  - name: unicase
    version: 2.7.0
    sha: f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89
  - name: unicode-bidi
    version: 0.3.13
    sha: 92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460
  - name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - name: unicode-normalization
    version: 0.1.22
    sha: 5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921
  - name: unicode-width
    version: 0.1.11
    sha: e51733f11c9c4f72aa0c160008246859e340b00807569a0da0e7a1079b27ba85
  - name: untrusted
    version: 0.9.0
    sha: 8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1
  - name: ureq
    version: 2.9.1
    sha: f8cdd25c339e200129fe4de81451814e5228c9b771d57378817d6117cc2b3f97
  - name: url
    version: 2.5.0
    sha: 31e6302e3bb753d46e83516cae55ae196fc0c309407cf11ab35cc51a4c2a4633
  - name: utf8parse
    version: 0.2.1
    sha: 711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a
  - name: uuid
    version: 1.6.1
    sha: 5e395fcf16a7a3d8127ec99782007af141946b4795001f876d54fb0d55978560
  - name: valuable
    version: 0.1.0
    sha: 830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d
  - name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: versions
    version: 5.0.1
    sha: c73a36bc44e3039f51fbee93e39f41225f6b17b380eb70cc2aab942df06b34dd
  - name: wait-timeout
    version: 0.2.0
    sha: 9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6
  - name: walkdir
    version: 2.4.0
    sha: d71d857dc86794ca4c280d616f7da00d2dbfd8cd788846559a6813e6aa4b54ee
  - name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - name: webpki-roots
    version: 0.25.3
    sha: 1778a42e8b3b90bff8d0f5032bf22250792889a5cdc752aa0020c84abe3aaf10
  - name: which
    version: 5.0.0
    sha: 9bf3ea8596f3a0dd5980b46430f2058dfe2c36a27ccfbb1845d6fbfcd9ba6e14
  - name: wild
    version: 2.2.0
    sha: 10d01931a94d5a115a53f95292f51d316856b68a035618eb831bbba593a30b67
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.6
    sha: f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: windows-sys
    version: 0.45.0
    sha: 75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0
  - name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
  - name: windows-sys
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
  - name: windows-targets
    version: 0.42.2
    sha: 8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071
  - name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - name: windows-targets
    version: 0.52.0
    sha: 8a18201040b24831fbb9e4eb208f8892e1f50a37feb53cc7ff887feb8f50e7cd
  - name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - name: windows_aarch64_gnullvm
    version: 0.52.0
    sha: cb7764e35d4db8a7921e09562a0304bf2f93e0a51bfccee0bd0bb0b666b015ea
  - name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - name: windows_aarch64_msvc
    version: 0.52.0
    sha: bbaa0368d4f1d2aaefc55b6fcfee13f41544ddf36801e793edbbfd7d7df075ef
  - name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - name: windows_i686_gnu
    version: 0.52.0
    sha: a28637cb1fa3560a16915793afb20081aba2c92ee8af57b4d5f28e4b3e7df313
  - name: windows_i686_msvc
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - name: windows_i686_msvc
    version: 0.52.0
    sha: ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a
  - name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - name: windows_x86_64_gnu
    version: 0.52.0
    sha: 3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd
  - name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - name: windows_x86_64_gnullvm
    version: 0.52.0
    sha: 1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e
  - name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
  - name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - name: windows_x86_64_msvc
    version: 0.52.0
    sha: dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04
  - name: winnow
    version: 0.5.19
    sha: 829846f3e3db426d4cee4510841b71a8e58aa2a76b1132579487ae430ccd9c7b
  - name: xattr
    version: 1.0.1
    sha: f4686009f71ff3e5c4dbcf1a282d0a44db3f021ba69350cd42086b3e5f1c6985
  - name: xwin
    version: 0.5.0
    sha: c43e0202f5457b48558096cb7b36d0e473f267551a89c82ed72d73b01dfd4007
  - name: yansi
    version: 0.5.1
    sha: 09041cd90cf85f7f8b2df60c646f853b7f535ce68f85244eb6731cf89fa498ec
  - name: zerocopy
    version: 0.7.28
    sha: 7d6f15f7ade05d2a4935e34a457b936c23dc70a05cc1d97133dc99e7a3fe0f0e
  - name: zerocopy-derive
    version: 0.7.28
    sha: dbbad221e3f78500350ecbd7dfa4e63ef945c05f4c61cb7f4d3f84cd0bba649b
  - name: zeroize
    version: 1.7.0
    sha: 525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d
  - name: zip
    version: 0.6.6
    sha: 760394e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261
