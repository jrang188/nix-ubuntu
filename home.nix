{ pkgs, ... }:
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
      jq
      wget
      curl

      # Programming Languages
      fnm
      bun
      uv
      go
      clang
      rustup

      # DevOps
      kubectl
      kubectx
      k9s
      kubernetes-helm
      tenv
      awscli2
      google-cloud-sdk
      pulumi-bin
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
          "bun"
          "kubectl"
          "helm"
          "terraform"
          "aws"
          "ubuntu"
          # "uv" oh-my-zsh plugin is not installed in latest nixpkg version
        ];
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      shellAliases = {
        ssh = "ssh.exe";
        ssh-add = "ssh-add.exe";
      };
      # The command for UV can be removed when oh-my-zsh nixpkg is updated
      initExtra = ''
        eval "$(fnm env --use-on-cd --shell zsh)"
        eval "$(uv generate-shell-completion zsh)"
      '';
    };

    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      useTheme = "tokyonight_storm";
    };
  };
}
