# flatpak-github-actions

Build your flatpak application using Github Actions

<p align="center">
  <img src="https://user-images.githubusercontent.com/15098724/55282117-f8253380-52fa-11e9-95a3-ccae83b23034.png" alt="Flatpak logo" />
</p>

## How to use?  

You only need to add this to your workflow file:

```yaml
uses: bilelmoussaoui/flatpak-builder-action@master
with:
  <insert the inputs here>
```

### Inputs

- `manifest-path`  
  This is the path to your application's manifest. It can be YAML or JSON.
- `flatpak-module`  
  The module name for your app. This is used to know which modules are
  dependencies and which are not.
- `app-id`  
  The ID of your application.
- `runtime-repo`  
  _(Optional)_ The repository that will be used to get the runtimes when the
  user installs the bundle. Defaults to https://flathub.org/repo/flathub.flatpakrepo.
- `bundle`  
  _(Optional)_ The file name that the bundle will have. Defaults to `app.flatpak`.

The Docker Image used can be found [here](docker/Dockerfile).

### Example

You can see a working example on this project, [here](.github/workflows/flatpak-test.yml)
