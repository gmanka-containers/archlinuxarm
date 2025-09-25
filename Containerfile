FROM docker.io/debian:latest AS bootstrapper

ARG TARGETARCH
ARG PACKAGE_GROUP=base
COPY scripts /scripts
RUN bash /scripts/bootstrap.sh

FROM scratch
COPY --from=bootstrapper /rootfs/ /
ENV LANG=en_US.UTF-8

RUN ln -sf /usr/lib/os-release /etc/os-release && \
    locale-gen && \
    pacman-key --init && \
    pacman-key --populate && \
    rm -rf /etc/pacman.d/gnupg/{openpgp-revocs.d/,private-keys-v1.d/,pubring.gpg~,gnupg.S.}*

CMD ["/usr/bin/bash"]
