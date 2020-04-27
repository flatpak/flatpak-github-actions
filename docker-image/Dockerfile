FROM fedora:latest

# Install flatpak builder deps
RUN dnf -y update && dnf install -y git 'dnf-command(builddep)' libtool \
        automake gettext-devel autoconf && \
    dnf builddep -y flatpak-builder && \
    dnf groupinstall -y "Development Tools"

# Clone Flatpak Builder on run-without-fuse branch and build it
RUN git clone --recursive https://github.com/flatpak/flatpak-builder -b run-without-fuse && \
    cd flatpak-builder && \
    ./autogen.sh && make -j$(nproc)

# Install it on a fresh container
FROM fedora:latest
COPY --from=0 /flatpak-builder/flatpak-builder /usr/local/bin/flatpak-builder

# Setup Flatpak
RUN dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb python3-ruamel-yaml

# Setup Flathub
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install -y --noninteractive flathub org.freedesktop.Sdk//19.08 org.freedesktop.Platform//19.08

# Create a non-root user
RUN useradd builduser
WORKDIR /home/builduser

ADD entrypoint.sh /entrypoint.sh
ADD build-flatpak.sh /build-flatpak.sh
ADD rewrite-flatpak-manifest /usr/local/bin/rewrite-flatpak-manifest
ENTRYPOINT ["sh", "/entrypoint.sh"]
