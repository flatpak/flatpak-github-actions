# Flatpak Github Actions

![CI](https://github.com/bilelmoussaoui/flatpak-github-actions/workflows/CI/badge.svg)

Build and deploy your Flatpak application using Github Actions

<p align="center">
  <img src="https://user-images.githubusercontent.com/15098724/55282117-f8253380-52fa-11e9-95a3-ccae83b23034.png" alt="Flatpak logo" />
</p>

## How to use

### Building stage

Add a new workflow by creating a `.yml` file under `.github/workflows` with this content

```yaml
on:
  push:
    branches: [main]
  pull_request:
name: CI
jobs:
  flatpak:
    name: "Flatpak"
    runs-on: ubuntu-latest
    container:
      image: bilelmoussaoui/flatpak-github-actions:gnome-40
      options: --privileged
    steps:
    - uses: actions/checkout@v2
    - uses: bilelmoussaoui/flatpak-github-actions/flatpak-builder@v4
      with:
        bundle: palette.flatpak
        manifest-path: org.gnome.zbrown.Palette.yml
        cache-key: flatpak-builder-${{ github.sha }}
```

#### Inputs

| Name | Description | Required | Default |
| ---     | ----------- | ----------- |----|
| `manifest-path` | The relative path of the manifest file  | Required | - |
| `bundle` | The bundle name  | Optional | `app.flatpak` |
| `repository-name` | The repository name, used to fetch the runtime when the user download the Flatpak bundle or when building the application  | Optional | `flathub` |
| `repository-url` | The repository url, used to fetch the runtime when the user download the Flatpak bundle or when building the application  | Optional | `https://flathub.org/repo/flathub.flatpakrepo` |
| `run-tests` | Enable/Disable running tests  | Optional | `false` |
| `branch` | The default flatpak branch  | Optional | `master` |
| `cache` | Enable/Disable caching `.flatpak-builder` directory | Optional | `true` |
| `cache-key` | Specifies the cache key. CPU arch is automatically added, so there is no need to add it to the cache key. | Optional | `flatpak-builder-${sha256(manifestPath)}` |
| `arch` | Specifies the CPU architecture to build for | Optional | `x86_64` |

#### Building for multiple CPU architectures

To build for CPU architectures other than `x86_64`, the GitHub Actions workflow has to either natively be running on that architecture (e.g. on an `aarch64` self-hosted GitHub Actions runner), or the container used must be configured to emulate the requested architecture (e.g. with QEMU).

For example, to build a Flatpak for both `x86_64` and `aarch64` using emulation, use the following workflow as a guide:

```yaml
on:
  push:
    branches: [main]
  pull_request:
name: CI
jobs:
  flatpak:
    name: "Flatpak"
    runs-on: ubuntu-latest
    container:
      image: bilelmoussaoui/flatpak-github-actions:gnome-40
      options: --privileged
    strategy:
      matrix:
        arch: [x86_64, aarch64]
      # Don't fail the whole workflow if one architecture fails
      fail-fast: false
    steps:
    - uses: actions/checkout@v2
    # Docker is required by the docker/setup-qemu-action which enables emulation
    - name: Install deps
      run: |
        dnf -y install docker
    - name: Set up QEMU
      id: qemu
      uses: docker/setup-qemu-action@v1
      with:
        platforms: arm64
    - uses: bilelmoussaoui/flatpak-github-actions/flatpak-builder@v4
      with:
        bundle: palette.flatpak
        manifest-path: org.gnome.zbrown.Palette.yml
        cache-key: flatpak-builder-${{ github.sha }}
        arch: ${{ matrix.arch }}
```

### Deployment stage

If you want to deploy the successfully built Flatpak application to a remote repository

```yaml
on:
  push:
    branches: [main]
name: Deploy
jobs:
  flatpak:
    name: "Flatpak"
    runs-on: ubuntu-latest
    container:
      image: bilelmoussaoui/flatpak-github-actions:gnome-40
      options: --privileged
    steps:
    - uses: actions/checkout@v2
    - uses: bilelmoussaoui/flatpak-github-actions/flatpak-builder@v4
      name: "Build"
      with:
        bundle: palette.flatpak
        manifest-path: org.gnome.zbrown.Palette.yml
        cache-key: flatpak-builder-${{ github.sha }}
    - uses: bilelmoussaoui/flatpak-github-actions/flat-manager@v3
      name: "Deploy"
      with:
        repository: elementary
        flat-manager-url: https://flatpak-api.elementary.io
        token: some_very_hidden_token
```

#### Inputs

| Name | Description | Required | Default |
| ---     | ----------- | ----------- |----|
| `repository` | The repository to push the build into  | Required | - |
| `flat-manager-url` | The flat-manager remote URL  | Required | - |
| `token` | A flat-manager token  | Required | - |

### Docker Image

The Docker image used for the action consists of 2 parts: The base image, based on Fedora and which can be found
[here](./Dockerfile), and the specific image of the runtime you choose, which is generated through
[this](.github/workflows/docker.yml) GitHub Actions workflow.

You can specify the specific runtime you need to use through the image tags:

| Runtime         | Version | Tag                 | Example                                                          |
| --------------- | ------- | ------------------- | ---------------------------------------------------------------- |
| Freedesktop SDK | 20.08   | `freedesktop-20.08` | `image: bilelmoussaoui/flatpak-github-actions:freedesktop-20.08` |
| GNOME           | 3.38    | `gnome-3.38`        | `image: bilelmoussaoui/flatpak-github-actions:gnome-3.38`        |
| GNOME           | 40    | `gnome-40`        | `image: bilelmoussaoui/flatpak-github-actions:gnome-40`        |
| GNOME           | master    | `gnome-nightly`        | `image: bilelmoussaoui/flatpak-github-actions:gnome-nightly`        |
| KDE             | 5.15    | `kde-5.15`          | `image: bilelmoussaoui/flatpak-github-actions:kde-5.15`          |
| elementary BaseApp             | juno    | `juno`          | `image: bilelmoussaoui/flatpak-github-actions:elementary-juno`          |
