export MIRRORLIST_URL="https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/pacman-mirrorlist/mirrorlist"
export BOOTSTRAP_EXTRA_PACKAGES='archlinuxarm-keyring'
export PACMAN_ARCH='aarch64'

curl -L https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/archlinuxarm-keyring/archlinuxarm-revoked -o /usr/share/keyrings/archlinuxarm-revoked
curl -L https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/archlinuxarm-keyring/archlinuxarm-trusted -o /usr/share/keyrings/archlinuxarm-trusted
curl -L https://raw.githubusercontent.com/archlinuxarm/PKGBUILDs/master/core/archlinuxarm-keyring/archlinuxarm.gpg -o /usr/share/keyrings/archlinuxarm.gpg
curl -L $MIRRORLIST_URL | sed -E 's/^\s*#\s*Server\s*=/Server =/g' | tee /etc/pacman.d/mirrorlist
sed -i 's/\$arch/aarch64/g' /etc/pacman.d/mirrorlist
