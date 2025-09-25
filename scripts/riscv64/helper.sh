export MIRRORLIST_URL="https://raw.githubusercontent.com/felixonmars/archriscv-packages/master/pacman-mirrorlist/mirrorlist"
export BOOTSTRAP_EXTRA_PACKAGES=''

mkdir /tmp/archlinux-keyring
curl -L https://archlinux.org/packages/core/any/archlinux-keyring/download | unzstd | tar -C /tmp/archlinux-keyring -xv
mv /tmp/archlinux-keyring/usr/share/pacman/keyrings/* /usr/share/keyrings
curl -L $MIRRORLIST_URL | sed -E 's/^\s*#\s*Server\s*=/Server =/g' | tee /etc/pacman.d/mirrorlist
