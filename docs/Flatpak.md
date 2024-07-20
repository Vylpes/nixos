# Flatpak

My instance uses [Flatpak](https://flatpak.org) for some of its applications,
specifically using the [Flathub](https://flathub.org) repository.

It's not possible to have flathub and its applications auto install via the
configuration. So this document will describe my process I do when I need to
install myself.

## Setup Flathub

The Flathub repository is added as a remote using the following command:

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

And then restart the system to finish.

## Install Packages

My system uses the current flatpak packages:
- Outlook for Linux
- Portal for Teams

You can install them via this command:

```bash
flatpak install flathub com.github.mahmoudbahaa.outlook_for_linux
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux
```

You will be able to run them via the rofi runner.
