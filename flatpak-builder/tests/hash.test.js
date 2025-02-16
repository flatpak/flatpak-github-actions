const { computeHash } = require('../index')

test('The manifest hash should be computed properly', async () => {
  const hash = await computeHash('./tests/manifest-1.yaml')
  expect(hash).toBe('199876765acd9df721a52bd7b9e424ee7f4f45e1623c7a4486087bf9a43536b2')

  const hash2 = await computeHash('./tests/manifest-3.json')
  expect(hash2).toBe('201c1afd5edd78d766cc9b0b74852e9459a7231bb40dcda0be4a73b1c394d75b')
})
