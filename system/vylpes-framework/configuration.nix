{pkgs, user, ...}: {
  
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "vylpes-framework";
  };

  services = {
    xserver = {
      displayManager = {
        # FIXME: Add proper xranger script for my setup
        setupCommands = ''
        '';
      };
    };
  };
}
