{pkgs, user, ...}: {
  
  documentation.nixos.enable = false;

  nix = {
    settings = {
      warn-dirty = false;
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  boot = {
    kernelParams = ["nohibernate"];
    tmp.cleanOnBoot = true;
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 300;
    };
  };

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  security = {
      rtkit.enable = true;
      pam.services.lightdm.enableGnomeKeyring = true;
  };

  services = {
    flatpak.enable = true;
    dbus.enable = true;
    picom.enable = true;
    gnome.gnome-keyring.enable = true;
    rsyncd.enable = true;
    openssh.enable = true;
    printing.enable = true;
    
    pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
    };

    xserver = {
      enable = true;
      xkb.layout = "us";

      windowManager.i3 = {
        enable = true;
        extraSessionCommands = ''
            eval $(${pkgs.gnome3.gnome-keyring}/bin/gnome-keyring-daemon --daemonize --components=ssh,secrets)
            export SSH_AUTH_SOCK
        '';
      };

      displayManager = {
        lightdm.enable = true;
        lightdm.greeters.gtk.enable = true;
      };
    };
  };

  users.users.vylpes = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "flatpak"
      "libvirtd"
      "vboxusers"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

  programs.virt-manager.enable = true;

  programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

    shellAliases = {
        lss = "ls -lah";

        gss = "git status -s";
        gaa = "git add -A";
        gcm = "git commit -m";
        gco = "git checkout";

        yt-mp3 = "yt-dlp -xi --audio-format mp3";
        yt-mp3-meta = "yt-dlp -xi --audio-format mp3 --parse-metadata \"playlist_index:%(track_number)s\" --add-metadata";
        yt-mp3-meta-cookies = "yt-dlp -xi --audio-format mp3 --parse-metadata \"playlist_index:%(track_number)s\" --add-metadata --cookies-from-browser firefox";
    };
  };
  
  programs.neovim.defaultEditor = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      hack-font
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["Hack"];
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Noto Sans" "Source Han Sans"];
      };
    };
  };


  environment = {
    systemPackages = with pkgs; [
        docker
        gnome.gnome-keyring
        libuuid
        spice
        spice-gtk
        spice-protocol
        win-virtio
        win-spice
    ];

    sessionVariables = {
        LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [pkgs.libuuid]}";
    };
  };

  virtualisation = {
    docker.enable = true;
    libvirtd = {
        enable = true;
        qemu = {
            swtpm.enable = true;
            ovmf.enable = true;
            ovmf.packages = [ pkgs.OVMFFull.fd ];
        };
    };
    virtualbox.host.enable = true;
  };

  xdg.portal = {
      enable = true;
      config.common.default = "*";
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  hardware.opengl.enable = true;

  system.stateVersion = "24.05";
}
