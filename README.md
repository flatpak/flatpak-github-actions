# Flatpak Github Actions

Build your flatpak application using Github Actions

<p align="center">
  <img src="https://user-images.githubusercontent.com/15098724/55282117-f8253380-52fa-11e9-95a3-ccae83b23034.png" alt="Flatpak logo" />
</p>

## How to use  

Add a new workflow by creating a `.yml` file under `.github/workflows` with this content

```yaml
on:
  push:
    branches: [master]
  pull_request:
name: CI
jobs:
  flatpak-builder:
    name: "Flatpak Builder"
    runs-on: ubuntu-latest
    container:
      image: docker.io/bilelmoussaoui/flatpak-github-actions
      options: --privileged
    steps:
    - uses: actions/checkout@master
    - uses: bilelmoussaoui/flatpak-github-actions@master
      with:
        bundle: "palette.flatpak"
        manifest-path: "org.gnome.zbrown.Palette.yml"
        app-id: "org.gnome.zbrown.Palette"
        flatpak-module: "palette"
```

## Inputs

| Name | Description | Required | Default |
| ---     | ----------- | ----------- |----|
| `manifest-path` | The relative path of the manifest file  | Required | - |
| `bundle` | The bundle name  | Optional | `app.flatpak` |
| `runtime-repo` | The repository used to fetch the runtime when the user download the Flatpak bundle.  | Optional | Flathub |
| `run-tests` | Enable/Disable running tests.  | Optional | `"flase"` |

The Docker Image used can be found [here](./docker/Dockerfile).
