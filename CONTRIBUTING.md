# Contributing

If you plan to contribute to flatpak-github-actions, here's a couple of things that could help you get started.

## Prerequisites

- NodeJS 16.x or newer
- Yarn

For more details, we recommend looking the extensive guide at [Creating a JavaScript action](https://docs.github.com/en/actions/creating-actions/creating-a-javascript-action#prerequisites)

```shell
yarn global add @vercel/ncc
yarn --cwd flatpak-builder --frozen-lockfile && yarn --cwd flat-manager --frozen-lockfile
```

Once you have modified the `index.js` of either `flatpak-builder` or `flat-manager` action. Make sure to compile the file to the `dist` directory. You can do so with

```shell
ncc build ./flatpak-builder/index.js -o ./flatpak-builder/dist/
ncc build ./flat-manager/index.js -o ./flat-manager/dist/
```

## Linting

```shell
yarn --cwd flatpak-builder install --also=dev && yarn --cwd flat-manager install --also=dev
yarn --cwd flatpak-builder run eslint . --fix && yarn --cwd flat-manager run eslint . --fix
```
