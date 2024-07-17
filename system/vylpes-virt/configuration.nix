{pkgs, user, ...}: {
  
  imports = [
    ../shared.nix
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "vylpes-virt";
  };
  
  services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr -s 1920x1080
  '';

  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xrdb}/bin/xrdb -merge <<EOF
        Xft.dpi: 96
        Xcursor.theme: Adwaita
    EOF
  '';

  virtualisation.virtualbox.guest.enable = true;
}
