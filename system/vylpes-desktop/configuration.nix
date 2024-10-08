{pkgs, user, ...}: {
  
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "vylpes-desktop";
  };

  services = {
    xserver = {
      displayManager = {
        # FIXME: Add proper xranger script for my setup
        setupCommands = ''
        '';
      };
      videoDrivers = [ "nvidia" ];
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    forceFullCompositionPipeline = true;
  };
}
