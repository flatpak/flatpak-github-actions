## Test build locally

### Tooling without building OCI image
```
bst build tooling.bst
```

### OCI image
```
bst build oci/tooling-ghcr-flatpak.bst
```

## Update an element with Rust crates

Update the first elements source that have not cargo as kind then do following command, crates will then be updated.

```
bst source track components/NAME_OF_THE_ELEMENT.bst
```

## Update junctions

```
bst source track freedesktop-sdk.bst
bst source track gnome-build-meta.bst
```

Both junctions are now update to the latest commit of their release branch

### Note for future update
- Freedesktop SDK can't be updated until flatpak-builder-lint supports lxml 5

## Upgrade junctions

1. Check on which Freedesktop SDK branch is used by GNOME Build Meta to know if Freedesktop SDK should/can be upgraded

2. Change `track` in junctions' sources to the new release branch.

3. Update junctions to track the last commit

4. Test build `tooling.bst`

### Note for future upgrade
- Check if a element in the components folder was added in Freedesktop SDK or GNOME Build Meta, if it does replace the local element by the junction
- git-lfs will be an element from Freedesktop SDK in 24.08, it is actually a GNOME Build Meta element for now
