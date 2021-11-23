# Contributing
If you plan to contribute to flatpak-github-actions, here's a couple of things that could help you get started.

## Prerequisites
- NodeJS 12.x or newer
- Yarn
- `vercel/ncc` you can install it with `yarn global add vercel/ncc` 

For more details, we recommend looking the extensive guide at [Creating a JavaScript action](https://docs.github.com/en/actions/creating-actions/creating-a-javascript-action#prerequisites)

Once you have modified the `index.js` of either `flatpak-builder` or `flat-manager` action. Make sure to compile the file to the `dist` directory. You can do so with

```shell
ncc build ./flatpak-builder/index.js -o ./flatpak-builder/dist/
ncc build ./flat-manager/index.js -o ./flat-manager/dist/
```
