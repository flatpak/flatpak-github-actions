const { computeHash } = require('../index')

test('The manifest hash should be computed properly', async () => {
  const hash = await computeHash('./tests/manifest-1.yaml')
  expect(hash).toBe('29ed9085544904a2bca91a82c487b5d33961650f488743473f801ccde9279ae7')

  const hash2 = await computeHash('./tests/manifest-3.json')
  expect(hash2).toBe('f75c438a29d4f04b7b53801a653e485fbdb773a284d9f53ae29087e927b2bdfe')
})
