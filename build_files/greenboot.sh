#!/usr/bin/env bash
source /ctx/common

PKGS=(
   greenboot
   greenboot-default-health-checks
)

DNF "${PKGS[@]}"

if [ -d /run/systemd/system ]; then
  systemctl enable \
    greenboot-healthcheck \
    greenboot-status \
    greenboot-loading-message \
    greenboot-grub2-set-counter \
    greenboot-grub2-set-success \
    greenboot-rpm-ostree-grub2-check-fallback \
    redboot-auto-reboot
fi
