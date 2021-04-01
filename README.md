# Flatpak Github Actions

![CI](https://github.com/bilelmoussaoui/flatpak-github-actions/workflows/CI/badge.svg)

Build your flatpak application using Github Actions

<p align="center">
  <img src="https://user-images.githubusercontent.com/15098724/55282117-f8253380-52fa-11e9-95a3-ccae83b23034.png" alt="Flatpak logo" />
</p>

## How to use  

Add a new workflow by creating a `.yml` file under `.github/workflows` with this content

```yaml
on:
  push:
    branches: [main]
  pull_request:
name: CI
jobs:
  flatpak-builder:
    name: "Flatpak Builder"
    runs-on: ubuntu-latest
    container:
      image: bilelmoussaoui/flatpak-github-actions:gnome-40
      options: --privileged
    steps:
    - uses: actions/checkout@v2
    - uses: bilelmoussaoui/flatpak-github-actions@v2
      with:
        bundle: "palette.flatpak"
        manifest-path: "org.gnome.zbrown.Palette.yml"
```

## Inputs

| Name | Description | Required | Default |
| ---     | ----------- | ----------- |----|
| `manifest-path` | The relative path of the manifest file  | Required | - |
| `bundle` | The bundle name  | Optional | `app.flatpak` |
| `runtime-repo` | The repository used to fetch the runtime when the user download the Flatpak bundle.  | Optional | Flathub |
| `run-tests` | Enable/Disable running tests.  | Optional | `false` |
| `branch` | The default flatpak branch.  | Optional | `master` |
| `cache` | Enable/Disable caching `.flatpak-builder` directory | Optional | `true` |
| `cache-key` | Specifies the cache key | Optional | `flatpak-builder-${sha256(manifestPath)}` |

## Docker Image

The Docker image used for the action consists of 2 parts: The base image, based on Fedora and which can be found
[here](docker/Dockerfile), and the specific image of the runtime you choose, which is generated through
[this](.github/workflows/docker.yml) GitHub Actions workflow.

You can specify the specific runtime you need to use through the image tags:

| Runtime         | Version | Tag                 | Example                                                          |
| --------------- | ------- | ------------------- | ---------------------------------------------------------------- |
| Freedesktop SDK | 20.08   | `freedesktop-20.08` | `image: bilelmoussaoui/flatpak-github-actions:freedesktop-20.08` |
| GNOME           | 3.38    | `gnome-3.38`        | `image: bilelmoussaoui/flatpak-github-actions:gnome-3.38`        |
| GNOME           | 40    | `gnome-40`        | `image: bilelmoussaoui/flatpak-github-actions:gnome-40`        |
| KDE             | 5.15    | `kde-5.15`          | `image: bilelmoussaoui/flatpak-github-actions:kde-5.15`          |
| elementary BaseApp             | juno    | `juno`          | `image: bilelmoussaoui/flatpak-github-actions:elementary-juno`          |

