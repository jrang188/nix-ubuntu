{ lib, pkgs, ... }:
let
  username = "sirwayne";
in
{
  home = {
    packages = with pkgs; [
      gnumake
      nil
      nixfmt-rfc-style
      fastfetch
      neofetch
    ];

    inherit username;
    homeDirectory = "/home/${username}";

    stateVersion = "24.11";
  };
  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      lfs.enable = true;
      userName = "Justin Ang";
      email = "justinray8823@gmail.com";
      ignores = [ ".DS_Store" ];
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.rebase = true;
      };
    };
  };
}
