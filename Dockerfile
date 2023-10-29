FROM fedora:latest

RUN dnf update -y && \
    dnf install -y dbus-daemon flatpak flatpak-builder git-lfs python3-aiohttp python3-tenacity python3-gobject xorg-x11-server-Xvfb ccache zstd libappstream-glib && \
    dnf clean all

RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
RUN flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo

RUN flatpak install flathub org.flatpak.Builder -y

ADD --chmod=755 https://raw.githubusercontent.com/flatpak/flat-manager/b07fe8652357ce16d9625f72f9acceaca94d860a/flat-manager-client /usr/bin
