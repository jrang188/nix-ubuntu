{ lib, pkgs, ... }:
let
  username = "sirwayne";
in
{
  home = {
    packages = with pkgs; [
      cowsay
      gnumake
      nil
      nixfmt-rfc-style
      fastfetch
      neofetch
    ];

    inherit username;
    homeDirectory = "/home/${username}";

    file = {
      "hello.txt" = {
        text = ''
          #!/usr/bin/env bash

          echo "Hello, ${username}!"
          echo '*slaps roof* This script can fit so many lines in it'
        '';
        executable = true;
      };
    };

    stateVersion = "24.11";
  };
  programs = {
    home-manager.enable = true;
  };
}
