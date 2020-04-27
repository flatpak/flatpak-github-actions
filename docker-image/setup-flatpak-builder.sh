# Install Flatpak Builder deps
dnf -y update
dnf install -y git 'dnf-command(builddep)' libtool automake gettext-devel autoconf
dnf builddep -y flatpak-builder
dnf groupinstall -y "Development Tools"

# Clone Flatpak Builder on run-without-fuse branch and build it
git clone --recursive https://github.com/flatpak/flatpak-builder -b run-without-fuse
cd flatpak-builder
./autogen.sh
make -j$(nproc)
