#!/bin/bash -e
NAME=docker.io/bilelmoussaoui/flatpak-github-actions

docker build . -t "$NAME"
docker push "$NAME"
