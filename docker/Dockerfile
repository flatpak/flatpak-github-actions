FROM fedora:latest

RUN dnf update -y && \
    dnf install -y flatpak flatpak-builder python3-aiohttp xorg-x11-server-Xvfb ccache zstd && \
    dnf clean all

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

ADD https://raw.githubusercontent.com/flatpak/flat-manager/master/flat-manager-client /usr/bin
RUN chmod +x /usr/bin/flat-manager-client
