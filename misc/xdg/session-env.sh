#!/bin/sh
# Refresh the systemd user environment after the AeroThemePlasma session has
# started, then restart the D-Bus activated portal services once so they pick
# it up. xdg-desktop-portal and flatpak-portal can otherwise keep the bare
# environment of the user manager snapshot they were started with, and every
# GUI application they launch aborts with "no Qt platform plugin could be
# initialized" because WAYLAND_DISPLAY/DISPLAY are missing.
#
# Only runs in the AeroThemePlasma session; the export is set by
# startatp-wayland before startplasma.

[ "${PLASMA_DEFAULT_SHELL:-}" = "io.gitgud.wackyideas.desktop" ] || exit 0
command -v systemctl >/dev/null 2>&1 || exit 0

systemctl --user import-environment \
    WAYLAND_DISPLAY DISPLAY XDG_RUNTIME_DIR XDG_SESSION_TYPE XDG_CURRENT_DESKTOP XDG_DATA_DIRS \
    2>/dev/null || true

systemctl --user try-restart \
    plasma-xdg-desktop-portal-kde.service xdg-desktop-portal.service flatpak-portal.service \
    2>/dev/null || true
