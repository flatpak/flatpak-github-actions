# Update system and install Flatpak
dnf -y update
dnf install -y flatpak flatpak-builder xorg-x11-server-Xvfb python3-ruamel-yaml
dnf clean all

# Create builduser
useradd builduser

# Add Flathub and install SDK
sudo -u devel sh -c \
"flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y --noninteractive --user flathub org.freedesktop.Sdk//19.08 org.freedesktop.Platform//19.08"
