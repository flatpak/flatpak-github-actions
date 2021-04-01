FROM fedora:latest

RUN dnf update -y && \
    dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb ccache zstd && \
    dnf clean all

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
