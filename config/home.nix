{pkgs, ...}: let
  username = "vylpes";
in {
  imports = [
    ./packages
  ];

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  services.gnome-keyring.enable = true;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";

    file = {
        "/home/${username}/.scripts/audio/get-sink-name.sh".source = ./home/scripts/audio/get-sink-name.sh;
        "/home/${username}/.cache/scripts/get-sink-name.txt".source = ./home/cache/audio/get-sink-name.txt;
    };

    packages = with pkgs; [
        alacritty
        cups
        curl
        discord
        dotnet-sdk_8
        dotnetPackages.Nuget
        dunst
        firefox
        flameshot
        flatpak
        font-awesome
        gimp
        git
        gnome.gnome-keyring
        grub2
        hack-font
        htop
        hugo
        i3
        i3lock-fancy
        keepassxc
        keepmenu
        lightdm
        lua
        meslo-lgs-nf
        mpv
        neovim
        networkmanager
        nextcloud-client
        nitrogen
        nodejs
        nodePackages.npm
        obsidian
        openssh
        openssl
        os-prober
        pavucontrol
        picom
        plexamp
        pm2
        polybar
        polybar-pulseaudio-control
        pulseaudio
        ranger
        rofi
        rofi-emoji
        slack
        steam
        tldr
        unzip
        vim
        vimPlugins.vim-plug
        vscode
        wget
        xclip
        yarn
        yt-dlp
        zip
        zsh
        zsh-powerlevel10k
    ];
  };
}
