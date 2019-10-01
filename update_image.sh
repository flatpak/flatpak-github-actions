#!/bin/bash -e
NAME=docker.io/bilelmoussaoui/flatpak-github-actions

sudo docker build . -t "$NAME"
sudo docker push "$NAME"