{ username, config, lib, pkgs, ... }:

let
  # Helper to detect Darwin (Future Proofing)
  isDarwin = builtins.elem pkgs.stdenv.hostPlatform.system [
    "x86_64-darwin"
    "aarch64-darwin"
  ];

  homeDir = if isDarwin then "/Users/${username}" else "/home/${username}";
in
{
  # Provide these as a top-level config options or bring them
  # into the rest of your modules via `config.username`, etc.

  options.isDarwin = lib.mkOption {
    type = lib.types.bool;
    default = isDarwin;
  };

  options.homeDir = lib.mkOption {
    type = lib.types.path;
    default = homeDir;
  };

  config = {
    home.username = username;
    home.homeDirectory = config.homeDir;
    home.stateVersion = "24.11";

    programs.home-manager.enable = true;
  };
}
