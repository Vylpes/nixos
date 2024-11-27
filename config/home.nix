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

  gtk.cursorTheme = pkgs.vimix-cursor-theme;

  xsession = {
    enable = true;
    initExtra = ''
        eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
        export SSH_AUTH_SOCK
    '';
  };

  services = {
    gnome-keyring.enable = true;
  };

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
        arandr
        autorandr
        brickstore
        csharp-ls
        cups
        curl
        dbeaver-bin
        discord
        distrobox
        dolphin-emu
        dotnet-sdk_8
        dotnetPackages.Nuget
        dunst
        easytag
        ffmpeg
        firefox
        flac
        flameshot
        flatpak
        font-awesome
        gimp
        git
        gnome.gnome-keyring
        grip
        grub2
        hack-font
        htop
        hugo
        i3
        i3-swallow
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
        playerctl
        plexamp
        pm2
        polybar
        polybar-pulseaudio-control
        pulseaudio
        ranger
        remmina
        rofi
        rofi-emoji
        slack
        steam
        sublime-music
        sxiv
        tldr
        unzip
        vim
        vimPlugins.vim-plug
        virtio-win
        vscode
        wget
        x11docker
        xclip
        yarn
        yt-dlp
        zip
        zsh
        zsh-powerlevel10k
    ];
  };
}
