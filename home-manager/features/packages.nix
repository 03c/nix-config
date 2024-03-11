{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.kitty
    pkgs.git
  ];
}
