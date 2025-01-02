{ config, ... }:
{
  ## MUST SET ZSH AS DEFAULT SHELL
  programs.zsh = {
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
        # Use 'macos' if isDarwin, else 'ubuntu'
        (if config.isDarwin then "macos" else "ubuntu")
        # "uv" oh-my-zsh plugin is not installed in latest nixpkg version
      ];
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    # Use .exe if not Darwin
    shellAliases =
      if config.isDarwin then
        {
          ssh = "ssh";
          ssh-add = "ssh-add";
        }
      else
        {
          ssh = "ssh.exe";
          ssh-add = "ssh-add.exe";
        };

    # The command for UV can be removed when oh-my-zsh nixpkg is updated
    initExtra = ''
      eval "$(fnm env --use-on-cd --shell zsh)"
      eval "$(uv generate-shell-completion zsh)"
    '';
  };
}
