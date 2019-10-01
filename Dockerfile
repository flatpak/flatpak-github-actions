FROM ubuntu:19.04

LABEL "com.github.actions.name"="Flatpak Builder"
LABEL "com.github.actions.description"="Build your flatpak project"
LABEL "com.github.actions.icon"="anchor"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/bilelmoussaoui/flatpak-github-actions"
LABEL "maintainer"="Bilal Elmoussaoui<bil.elmoussaoui@gmail.com>"

RUN apt-get update -y 
RUN apt-get upgrade -y 
RUN apt-get install -y flatpak-builder flatpak

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]