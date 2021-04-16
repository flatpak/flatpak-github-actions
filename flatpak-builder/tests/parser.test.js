const { parseManifest, modifyManifest } = require('../index')

test('The manifest should be parsed correctly', async () => {
  const manifest = await parseManifest('./tests/manifest-1.yaml')
  expect(manifest['app-id']).toBe('org.example.MyApp.Devel')
  expect(manifest.modules).toEqual([
    {
      name: 'testproject',
      buildsystem: 'meson',
      'config-opts': ['-Dprofile=development'],
      sources: [
        {
          type: 'git',
          url: 'https://github.com/bilelmoussaoui/flatpak-github-actions.git'
        }
      ]
    }
  ])
})

test('The manifest should be modified correctly if tests are enabled', async () => {
  const manifest = await parseManifest('./tests/manifest-1.yaml')
  const modifiedManifest = modifyManifest(manifest, true)

  expect(modifiedManifest['build-options']).toEqual({
    'test-args': ['--socket=x11', '--share=network'],
    env: {
      DISPLAY: '0:0'
    }
  })
  const lastModule = modifiedManifest.modules.slice(-1)[0]
  expect(lastModule.name).toBe('testproject')
  expect(lastModule['run-tests']).toBe(true)
})

test('The manifest should be modified correctly if tests are enabled & has a build-options', async () => {
  const manifest = await parseManifest('./tests/manifest-3.json')
  const modifiedManifest = modifyManifest(manifest, true)

  expect(modifiedManifest['build-options']).toEqual({
    'append-path': '/usr/lib/sdk/rust-stable/bin',
    'build-args': ['--share=network'],
    'test-args': ['--socket=x11', '--share=network'],
    env: {
      DISPLAY: '0:0',
      CARGO_HOME: '/run/build/contrast/cargo',
      RUST_BACKTRACE: '1',
      RUST_LOG: 'contrast=info'
    }
  })
  const lastModule = modifiedManifest.modules.slice(-1)[0]
  expect(lastModule.name).toBe('contrast')
  expect(lastModule['run-tests']).toBe(true)
})

test('The manifest should be modified correctly if in a subdirectory', async () => {
  const manifest = await parseManifest('./tests/app-test/manifest-2.yaml')
  const modifiedManifest = modifyManifest(manifest)

  const lastModule = modifiedManifest.modules.slice(-1)[0]
  expect(lastModule.name).toBe('testproject')
  expect(lastModule['run-tests']).toBe(undefined)
})
