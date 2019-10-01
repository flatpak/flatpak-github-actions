FROM fedora:31

LABEL "com.github.actions.name"="Flatpak Builder"
LABEL "com.github.actions.description"="Build your flatpak project"
LABEL "com.github.actions.icon"="anchor"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/bilelmoussaoui/flatpak-github-actions"
LABEL "maintainer"="Bilal Elmoussaoui<bil.elmoussaoui@gmail.com>"


RUN dnf update -y 
RUN dnf install -y flatpak-builder flatpak

# Setup Flathub
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]