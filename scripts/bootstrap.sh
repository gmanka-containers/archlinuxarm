#!/usr/bin/env bash

set -uexo pipefail

rm -f /etc/apt/apt.conf.d/docker-clean
echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
apt update
apt install -y --no-install-recommends arch-install-scripts pacman-package-manager makepkg curl ca-certificates xz-utils zstd
cat /scripts/$TARGETARCH/repos.conf | tee -a /etc/pacman.conf
sed -i 's/^CheckSpace/#CheckSpace/' /etc/pacman.conf
mkdir -p /etc/pacman.d
source /scripts/$TARGETARCH/helper.sh
pacman-key --init
pacman-key --populate
mkdir -p /rootfs
mkdir -m 0755 -p /rootfs/var/{cache/pacman/pkg,lib/pacman,log} /rootfs/{dev,run,etc}
mkdir -m 1777 -p /rootfs/tmp
mkdir -m 0555 -p /rootfs/{sys,proc}
pacman -r /rootfs -Sy --noconfirm $PACKAGE_GROUP $BOOTSTRAP_EXTRA_PACKAGES iptables-nft
cp /etc/pacman.d/mirrorlist /rootfs/etc/pacman.d/mirrorlist
echo 'en_US.UTF-8 UTF-8' | tee /rootfs/etc/locale.gen
echo 'LANG=en_US.UTF-8' | tee /rootfs/etc/locale.conf
