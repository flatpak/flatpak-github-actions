const { computeHash } = require('../index')

test('The manifest hash should be computed properly', async () => {
  const hash = await computeHash('./tests/manifest-1.yaml')
  expect(hash).toBe('3cf572c168d382e9b6005b48d082d021e98ff146c1d033a446236dec6353a0d9')

  const hash2 = await computeHash('./tests/manifest-3.json')
  expect(hash2).toBe('8749e01dcad8f52f51083e213ad0a30e20c9a5a7788b3eb8bebb26b2651193a9')
})
