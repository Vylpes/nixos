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

  services = {
    flatpak.enable = true;
    dbus.enable = true;
    picom.enable = true;

    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      layout = "us";

      displayManager = {
        lightdm.enable = true;
      };
    };
  };

  users.users.vylpes = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "flatpak"
      "wheel"
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };

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

  environment.systemPackages = with pkgs; [
    docker
  ];

  virtualisation.docker.enable = true;

  xdg.portal.enable = true;

  system.stateVersion = "24.05";
}
