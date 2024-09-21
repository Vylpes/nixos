# Grub

This document is for information regarding Grub.

## Reinstall Grub

If the grub install breaks and you ever need to reinstall grub, the following
command is how you do it:

```bash
sudo NIXOS_INSTALL_BOOTLOADER=1 /nix/var/nix/profiles/system/bin/switch-to-configuration boot
```
