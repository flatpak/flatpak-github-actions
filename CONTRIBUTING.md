# Contributing

If you plan to contribute to flatpak-github-actions, here's a couple of things that could help you get started.

## Prerequisites

- NodeJS 16.x or newer
- Yarn
- `@vercel/ncc` you can install it with `yarn global add @vercel/ncc`

For more details, we recommend looking the extensive guide at [Creating a JavaScript action](https://docs.github.com/en/actions/creating-actions/creating-a-javascript-action#prerequisites)

Once you have modified the `index.js` of either `flatpak-builder` or `flat-manager` action, make sure to compile the file to the `dist` directory. 
Note: You should have already installed the npm packages of both `flatpak-builder` and `flat-manager`, with yarn. 

```shell
ncc build ./flatpak-builder/index.js -o ./flatpak-builder/dist/
ncc build ./flat-manager/index.js -o ./flat-manager/dist/
```
