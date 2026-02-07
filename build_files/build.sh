#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 remove -y                      \
    yelp                            \
    lutris                          \
    waydroid                        \
    waydroid-selinux                \
    rom-properties                  \
    rom-properties-gtk3             \
    rom-properties-utils            \
    rom-properties-common           \
    rom-properties-thumbnailer-dbus \
    malcontent-control              \
    webapp-manager                  \
    input-remapper

# this installs a package from fedora repos
dnf5 install -y                     \
    emacs                           \
    clang                           \
    love                            \

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

rm -f /usr/share/applications/discourse.desktop
rm -f /usr/share/applications/system-update.desktop
rm -f /usr/share/applications/bazzite-steam-bpm.desktop
rm -f /usr/share/applications/bazzite-documentation.desktop
rm -f /usr/share/applications/waydroid-container-restart.desktop

#### Example for enabling a System Unit File

systemctl enable podman.socket
