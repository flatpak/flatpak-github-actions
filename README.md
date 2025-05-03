<div align="center">

# Flatpak GitHub Actions

Build and deploy your Flatpak application using GitHub Actions

<img src="https://github.com/flatpak/flatpak/raw/main/flatpak.png?raw=true" alt="Flatpak logo" />

![CI](https://github.com/flatpak/flatpak-github-actions/workflows/CI/badge.svg)

</div>

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
      image: ghcr.io/flathub-infra/flatpak-github-actions:gnome-48
      options: --privileged
    steps:
    - uses: actions/checkout@v4
    - uses: flatpak/flatpak-github-actions/flatpak-builder@v6
      with:
        bundle: palette.flatpak
        manifest-path: org.gnome.zbrown.Palette.yml
        cache-key: flatpak-builder-${{ github.sha }}
```

#### Inputs

| Name | Description | Required | Default |
| ---     | ----------- | ----------- |----|
| `manifest-path` | The relative path of the manifest file  | Required | - |
| `stop-at-module` | Stop at the specified module, ignoring it and all the following ones. Using this option disables generating bundles. | Optional | Build all modules from the manifest file |
| `bundle` | The bundle name  | Optional | `app.flatpak` |
| `build-bundle` | Whether to build a bundle or not | Optional | `true` |
| `repository-name` | The repository name, used to fetch the runtime when the user download the Flatpak bundle or when building the application  | Optional | `flathub` |
| `repository-url` | The repository url, used to fetch the runtime when the user download the Flatpak bundle or when building the application  | Optional | `https://flathub.org/repo/flathub.flatpakrepo` |
| `run-tests` | Enable/Disable running tests. This overrides the `flatpak-builder` option of the same name, which invokes `make check` or `ninja test`. Network and X11 access is enabled, with a display server provided by `xvfb-run`.  | Optional | `false` |
| `branch` | The default flatpak branch  | Optional | `master` |
| `cache` | Enable/Disable caching `.flatpak-builder` directory | Optional | `true` |
| `restore-cache` | Enable/Disable cache restoring. If caching is enabled. | Optional | `true` |
| `cache-key` | Specifies the cache key. CPU arch is automatically added, so there is no need to add it to the cache key. | Optional | `flatpak-builder-${arch}-${sha256(manifestPath)}` |
| `arch` | Specifies the CPU architecture to build for | Optional | `x86_64` |
| `mirror-screenshots-url` | Specifies the URL to mirror screenshots | Optional | - |
| `gpg-sign` | The key to sign the package | Optional | - |
| `verbose` | Enable verbosity | Optional | `false` |
| `upload-artifact` | Whether to upload the resulting bundle or not as an artifact | Optional | `true` |

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
      image: ghcr.io/flathub-infra/flatpak-github-actions:gnome-48
      options: --privileged
    strategy:
      matrix:
        arch: [x86_64, aarch64]
      # Don't fail the whole workflow if one architecture fails
      fail-fast: false
    steps:
    - uses: actions/checkout@v4
    # Docker is required by the docker/setup-qemu-action which enables emulation
    - name: Install deps
      if: ${{ matrix.arch != 'x86_64' }}
      run: |
        # Use the static binaries because it's unable to use a package manager 
        curl https://download.docker.com/linux/static/stable/x86_64/docker-26.0.0.tgz --output ./docker.tgz
        tar xzvf docker.tgz
        mv docker/* /usr/bin
    - name: Set up QEMU
      if: ${{ matrix.arch != 'x86_64' }}
      id: qemu
      uses: docker/setup-qemu-action@v3
      with:
        platforms: arm64
    - uses: flatpak/flatpak-github-actions/flatpak-builder@v6
      with:
        bundle: palette.flatpak
        manifest-path: org.gnome.zbrown.Palette.yml
        cache-key: flatpak-builder-${{ matrix.arch }}-${{ github.sha }}
        arch: ${{ matrix.arch }}
```

#### Multi arch build using public ARM64 runners

Since, January 2025, [GitHub offers public ARM64 runners](https://github.blog/changelog/2025-01-16-linux-arm64-hosted-runners-now-available-for-free-in-public-repositories-public-preview/).
So a multi-arch build can be performed using that.

```yaml
name: CI

on:
  push:
    branches: [main]
  pull_request:

jobs:
  flatpak:
    name: "Flatpak"
    container:
      image: ghcr.io/flathub-infra/flatpak-github-actions:gnome-48
      options: --privileged
    strategy:
      matrix:
        variant:
          - arch: x86_64
            runner: ubuntu-24.04
          - arch: aarch64
            runner: ubuntu-24.04-arm
    runs-on: ${{ matrix.variant.runner }}
    steps:
      - uses: actions/checkout@<commit hash>
      - uses: flatpak/flatpak-github-actions/flatpak-builder@v6
        with:
          bundle: palette.flatpak
          manifest-path: org.gnome.zbrown.Palette.yml
          cache-key: flatpak-builder-${{ github.sha }}
          arch: ${{ matrix.variant.arch }}
          verbose: true
```

#### Building for Automated Tests

As described in the [Inputs](#inputs) documentation, specifying `run-tests: true` will amend the Flatpak manifest to enable Network and X11 access automatically. Any other changes to the manifest must be made manually, such as building the tests (e.g. `-Dtests=true`) or any other options (e.g. `--buildtype=debugoptimized`).

Most developers will want to run tests on pull requests, before merging into the main branch of a repository. To ensure your manifest is building the correct code, you should set the `sources` entry for your project to `"type": "dir"` with the `path` key relative to the manifest's location in the repository.

In the example below, the manifest is located at `/build-aux/flatpak/org.gnome.zbrown.Palette.json`, so the `path` key is set to `../../`. If the manifest were in the project root instead, the correct usage would be `"path": "./"`.

```json
{
    "app-id" : "org.gnome.zbrown.Palette",
    "runtime" : "org.gnome.Platform",
    "runtime-version" : "master",
    "sdk" : "org.gnome.Sdk",
    "command" : "org.gnome.zbrown.Palette",
    "finish-args" : [
        "--share=ipc",
        "--device=dri",
        "--socket=fallback-x11",
        "--socket=wayland"
    ],
    "modules" : [
        {
            "name" : "palette",
            "buildsystem" : "meson",
            "config-opts" : [
                "--prefix=/app",
                "--buildtype=debugoptimized",
                "-Dtests=true"
            ],
            "sources" : [
                {
                    "name" : "palette",
                    "buildsystem" : "meson",
                    "type" : "dir",
                    "path" : "../../"
                }
            ]
        }
    ]
}
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
      image: ghcr.io/flathub-infra/flatpak-github-actions:gnome-48
      options: --privileged
    steps:
    - uses: actions/checkout@v4
    - uses: flatpak/flatpak-github-actions/flatpak-builder@v6
      name: "Build"
      with:
        bundle: palette.flatpak
        manifest-path: org.gnome.zbrown.Palette.yml
        cache-key: flatpak-builder-${{ github.sha }}
    - uses: flatpak/flatpak-github-actions/flat-manager@v6
      name: "Deploy"
      with:
        repository: elementary
        flat-manager-url: https://flatpak-api.elementary.io
        token: some_very_hidden_token
        end-of-life: "The application has been renamed to..."
        end-of-life-rebase: "org.zbrown.Palette"
```

#### Inputs

| Name | Description | Required | Default |
| ---     | ----------- | ----------- |----|
| `repository` | The repository to push the build into  | Required | - |
| `flat-manager-url` | The flat-manager remote URL  | Required | - |
| `token` | A flat-manager token  | Required | - |
| `end-of-life` | Reason for end of life  | Optional | - |
| `end-of-life-rebase` | The new app-id  | Optional | - |
| `build-log-url` | URL to Flatpak build log | Optional | - |
| `verbose` | Enable verbosity | Optional | `false` |

### Container Images

You can use the generated images by Flathub at <https://github.com/flathub-infra/actions-images> to avoid re-installing the SDKs for every build.
