FROM registry.fedoraproject.org/fedora:latest

RUN dnf update -y && \
    dnf install -y flatpak flatpak-builder git-lfs ccache zstd \
                   python3-aiohttp python3-tenacity python3-gobject \
                   dbus-daemon xorg-x11-server-Xvfb && \
    dnf clean all && rm -rf /var/cache/dnf

ADD https://raw.githubusercontent.com/flatpak/flat-manager/master/flat-manager-client /usr/bin
RUN chmod +x /usr/bin/flat-manager-client