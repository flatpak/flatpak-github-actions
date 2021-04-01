const { computeHash} = require('../index')


test('The manifest hash should be computed properly', async () => {
    const hash = await computeHash('./tests/manifest-1.yaml')
    expect(hash).toBe('df49da0581c3914b06ef48122b3a5003d91350acfba6972a9bf26ac9fb3f7ae6')

    const hash2 = await computeHash('./tests/manifest-3.json')
    expect(hash2).toBe('21effbaab820d8f4fe2d415c1774bc0a80fe6b45e6ada5720515c9a2f0eeedd0')
})