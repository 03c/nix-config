{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports =
    [
      ./hardware-configuration.nix
      ./features/hyprland.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bFrame";
  networking.hostId = "c44f83d3";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };
  
  users.users.cchild = {
    initialHashedPassword = "$y$j9T$JK1FGk0dRnex7hYikewCB.$3eEr8Yhuy2tQMv66mAuvfNWIlp3gREqGnsG7KxpxFq6";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [ ];
  };
  
  system.stateVersion = "23.11"; # Did you read the comment?
}

