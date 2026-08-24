const { computeHash } = require('../index')

test('The manifest hash should be computed properly', async () => {
  const hash = await computeHash('./tests/manifest-1.yaml')
  expect(hash).toBe('bfa2f526142a224357f3ed54a892f87f18cf31dc70292c2ec607ab5d15737bda')

  const hash2 = await computeHash('./tests/manifest-3.json')
  expect(hash2).toBe('c5594b7e299e5d75d909382e7150d4673f028a59ea5c4993afeb546220ea2648')
})
