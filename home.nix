{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "sirwayne";
    homeDirectory = "/home/sirwayne";

    stateVersion = "24.11";
  };
}