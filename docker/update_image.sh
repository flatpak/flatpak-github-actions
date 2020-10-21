#!/bin/bash -e
NAME=docker.io/bilelmoussaoui/flatpak-github-actions

podman build . -t "$NAME"
podman push "$NAME"
