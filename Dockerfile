FROM fedora:31

LABEL "com.github.actions.name"="Flatpak Builder"
LABEL "com.github.actions.description"="Build your flatpak project"
LABEL "com.github.actions.icon"="anchor"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/bilelmoussaoui/flatpak-github-actions"
LABEL "maintainer"="Bilal Elmoussaoui<bil.elmoussaoui@gmail.com>"

# Setup Flatpak
RUN dnf install -y flatpak flatpak-builder

# Setup Flathub
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

RUN flatpak install -y --noninteractive flathub org.freedesktop.Sdk//19.08 org.freedesktop.Platform//19.08

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]