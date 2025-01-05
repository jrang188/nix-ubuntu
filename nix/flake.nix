{
  description = "My Home Manager configuration in Ubuntu";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      specialArgs = {
        username = "sirwayne";
      };
    in
    {
      homeConfigurations = {
        sirwayne = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = specialArgs;
          modules = [
            ./modules/common.nix
            ./modules/packages.nix
            ./modules/git.nix
            ./modules/zsh.nix
            ./modules/oh-my-posh.nix
            ./modules/neovim.nix
          ];
        };
      };
      formatter.${system} = pkgs.nixfmt-rfc-style;
    };

}
