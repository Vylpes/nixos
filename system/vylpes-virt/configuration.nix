{pkgs, user, ...}: {
  
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "vylpes-virt";
  };
}
