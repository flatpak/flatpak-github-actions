FROM fedora:latest

# Update system and install Flatpak
RUN dnf -y update && \
    dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb python3-ruamel-yaml && \
    dnf clean all
    
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub org.freedesktop.Sdk//20.08 org.freedesktop.Platform//20.08

COPY rewrite-flatpak-manifest /usr/local/bin/rewrite-flatpak-manifest

RUN dnf install -y xorg-x11-xinit
RUN dnf install -y xorg-x11-server-Xorg