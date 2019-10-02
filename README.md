# flatpak-github-actions
Build your flatpak application using Github Actions

<p align="center">
  <img src="https://user-images.githubusercontent.com/15098724/55282117-f8253380-52fa-11e9-95a3-ccae83b23034.png" alt="Flatpak logo" />
</p>

## How to use?  

Add a new workflow by creating a `.yml` file under `.github/workflows` with this content

```yaml
on: [push, pull_request]
name: Flatpak
jobs:
  flatpak-builder:
    name: "Flatpak Builder"
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Pull the Docker Image
      run: docker pull bilelmoussaoui/flatpak-github-actions:latest
    - name: Run Docker Image
      run: |
            docker run --cap-add SYS_ADMIN --cap-add NET_ADMIN --device /dev/fuse \
                 --security-opt apparmor:unconfined --security-opt seccomp=unconfined \
                --workdir /github/workspace \
                --rm -e INPUT_ARGS -e HOME -e GITHUB_REF -e GITHUB_SHA  \
                -e GITHUB_REPOSITORY -e GITHUB_ACTOR -e GITHUB_WORKFLOW  \
                -e GITHUB_HEAD_REF -e GITHUB_BASE_REF -e GITHUB_EVENT_NAME \
                -e GITHUB_WORKSPACE -e GITHUB_ACTION -e GITHUB_EVENT_PATH -e RUNNER_OS  \
                -e RUNNER_TOOL_CACHE -e RUNNER_TEMP -e RUNNER_WORKSPACE \
                -v "/var/run/docker.sock":"/var/run/docker.sock" \
                -v "/home/runner/work/_temp/_github_home":"/github/home" \
                -v "/home/runner/work/_temp/_github_workflow":"/github/workflow" \
                -v ${{ github.workspace }}:"/github/workspace" \
                --rm -i bilelmoussaoui/flatpak-github-actions:latest \
                    --manifest-path "org.gnome.zbrown.Palette.yaml" \
                    --app-id "org.gnome.zbrown.Palette" \
                    --bundle "palette-nightly.flatpak"
```


### Arguments:
- `--manifest-path`

    The relative path the manifest file in this repository.

- `--app-id`

    The application ID

- `--bundle`

    The bundle name, by default it's `app.flatpak`

- `--runtime-repo`

    The repository used to fetch the runtime when the user download the Flatpak bundle.
    
    By default it's set to https://flathub.org/repo/flathub.flatpakrepo



The Docker Image used can be found [here](./Dockerfile).
