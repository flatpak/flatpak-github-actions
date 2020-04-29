FROM fedora:latest

LABEL "repository"="https://github.com/bilelmoussaoui/flatpak-github-actions"
LABEL "homepage"="https://github.com/bilelmoussaoui/flatpak-github-actions"
LABEL "maintainer"="Bilal Elmoussaoui<bil.elmoussaoui@gmail.com>"

# Update system and install necessary packages
RUN dnf -y update && \
    dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb python3-ruamel-yaml && \
    dnf clean all

# Add Flathub and install the freedesktop SDK
RUN flatpak remote-add --if-not-exists flathub \
            https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install -y --noninteractive flathub org.freedesktop.Sdk//19.08 \
            org.freedesktop.Platform//19.08

ADD entrypoint.sh /entrypoint.sh
ADD rewrite-flatpak-manifest.py /rewrite-flatpak-manifest.py
ENTRYPOINT ["sh", "/entrypoint.sh"]
