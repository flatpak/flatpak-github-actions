FROM fedora:latest

# Install Flatpak Builder deps
RUN dnf -y update && \
    dnf install -y git 'dnf-command(builddep)' libtool automake gettext-devel \
        autoconf && \
    dnf builddep -y flatpak-builder && \
    dnf groupinstall -y "Development Tools"

# Clone Flatpak Builder on run-without-fuse branch and build it
RUN git clone --recursive https://github.com/flatpak/flatpak-builder -b run-without-fuse && \
    cd flatpak-builder && \
    ./autogen.sh && \
    make -j$(nproc)

# Install flatpak-builder on a fresh image
FROM fedora:latest
COPY --from=0 /flatpak-builder/flatpak-builder /usr/local/bin/flatpak-builder

# Update system and install Flatpak
RUN dnf -y update && \
    dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb python3-ruamel-yaml && \
    dnf clean all

# Create builduser
RUN useradd builduser

# Add Flathub and install SDK
USER builduser

RUN flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install -y --noninteractive --user flathub org.freedesktop.Sdk//19.08 org.freedesktop.Platform//19.08

USER root

COPY entrypoint.sh /entrypoint.sh
COPY build-flatpak.sh /build-flatpak.sh
COPY rewrite-flatpak-manifest /usr/local/bin/rewrite-flatpak-manifest
ENTRYPOINT ["sh", "/entrypoint.sh"]
