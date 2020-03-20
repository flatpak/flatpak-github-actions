FROM fedora:latest
# Setup Flatpak
RUN dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb

# Setup Flathub
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

RUN flatpak install -y --noninteractive flathub org.freedesktop.Sdk//19.08 org.freedesktop.Platform//19.08

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]
