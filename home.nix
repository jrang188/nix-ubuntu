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

      # NodeJS Development
      fnm
      pnpm
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
      userEmail = "justinray8823@gmail.com";
      ignores = [ ".DS_Store" ];
      extraConfig = {
        init.defaultBranch = "main";
        push.autoSetupRemote = true;
        pull.ff = "only";
        core.sshCommand = "ssh.exe";
      };
    };

    ## MUST SET ZSH AS DEFAULT SHELL
    zsh = {
      enable = true;
      enableCompletion = true;
      autocd = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "fnm"
        ];
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        ssh = "ssh.exe";
        ssh-add = "ssh-add.exe";
      };
      initExtraBeforeCompInit = ''
        eval "$(fnm env --use-on-cd --shell zsh)"
      '';
    };

    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      useTheme = "tokyonight_storm";
    };

  };
}
