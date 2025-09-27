# Arch Linux Docker Image (Multiarch)

### git repo mirrors
- https://github.com/gmanka-containers/archlinuxarm
- https://gitlab.com/gmanka-containers/archlinuxarm
- https://codeberg.org/gmanka-containers/archlinuxarm

### container repo mirrors
- quay.io/gmanka/archlinuxarm
- docker.io/gmanka/archlinuxarm
- ghcr.io/gmanka-containers/archlinuxarm

### forked from
- https://github.com/Menci/docker-archlinuxarm

This is the Docker image for Arch Linux ARM but for compatibility some other targets are also included. All images are built on GitHub Actions automatically.

The supported platforms are:

* `linux/arm64`
* `linux/amd64`
* `linux/arm/v7`
* `linux/riscv64`

Just just like the official Arch Linux AMD64 image, it has two tags:

* `base` (default): installed only the package group `base`.
* `base-devel`: installed the package group `base-devel`.

And, the pamcan lsign-key is also removed for [security reasons](https://gitlab.archlinux.org/archlinux/archlinux-docker/-/blob/bc4d9f8ec5bdcbedefc96a2a1beaf33f01c07812/README.md#principles).
