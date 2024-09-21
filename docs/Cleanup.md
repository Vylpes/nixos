# Cleanup

This document refers to information about cleaning the system, such as deleting
old generations, unused nix shells, etc.

## Delete Old Generations

Run the following commands to clean the system up and delete old generations:

```bash
nix-collect-garbage --delete-old
sudo nox-collect-garbage -d
sudo /run/current-system/bin/switch-to-configuration boot
```
