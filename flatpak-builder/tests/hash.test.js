const { computeHash } = require('../index')

test('The manifest hash should be computed properly', async () => {
  const hash = await computeHash('./tests/manifest-1.yaml')
  expect(hash).toBe('8c43f78c9f33c1f379521211c9b9e91fe051cef3f638e4427026beb27261a587')

  const hash2 = await computeHash('./tests/manifest-3.json')
  expect(hash2).toBe('fb531a4e4d3227ff9cdb37b8d1b9830878aa63542a066c2bd157dd94c7dda1ba')
})
