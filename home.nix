{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      cowsay
      gnumake
    ];

    username = "sirwayne";
    homeDirectory = "/home/sirwayne";

    stateVersion = "24.11";
  };
  programs = {
    home-manager.enable = true;
  };
}