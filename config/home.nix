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

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";

    file = {
        `/home/${username}/.scripts/audio/get-sink-name.sh`.source = ./home/scripts/audio/get-sink-name.sh;
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
        grub2
        hack-font
        hugo
        i3
        i3lock-fancy
        keepassxc
        keepmenu
        lightdm
        lua
        meslo-lgs-nf
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
        pm2
        plexamp
        polybar
        rofi
        rofi-emoji
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
