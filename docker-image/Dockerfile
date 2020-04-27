FROM fedora:latest

COPY setup-flatpak-builder.sh /setup-flatpak-builder.sh
RUN sh /setup-flatpak-builder.sh

# Install flatpak-builder on a fresh image
FROM fedora:latest
COPY --from=0 /flatpak-builder/flatpak-builder /usr/local/bin/flatpak-builder

COPY setup-flatpak-environment.sh /setup-flatpak-environment.sh
RUN sh /setup-flatpak-environment.sh

COPY entrypoint.sh /entrypoint.sh
COPY build-flatpak.sh /build-flatpak.sh
COPY rewrite-flatpak-manifest /usr/local/bin/rewrite-flatpak-manifest
ENTRYPOINT ["sh", "/entrypoint.sh"]
