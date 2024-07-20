# Update

The following document describes the process on updating the NixOS system.

## Updating Flake

The flake's lockfile will need to be updated to fetch newer packages. This is
like running `apt update` on a Debian system.

Run the following command in the flake git repository:

```bash
nix flake update
```

> **NOTE:** This will update the git repository, but might be a good idea to
check if the changes break the system at all before committing them to the
repository, or at least the `main` branch.

## Rebuilding System

You then need to reapply the flake to the system for the changes to take
affect. This is like running `apt upgrade` on a Debian system.

Run the following command in the flake git repository, replacing `#HOSTNAME`
with the current system's hostname:

```bash
sudo nixos-rebuild switch --flake .#HOSTNAME
```

