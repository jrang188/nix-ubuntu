{ pkgs, ... }:
{

  home.packages = with pkgs; [
    gnumake
    nil
    nixfmt-rfc-style
    fastfetch
    neofetch
    jq
    wget
    curl
    fzf
    fd
    ripgrep
    lazygit
    stow
    zip
    unzip
    tree

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
}
