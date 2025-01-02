{ config, ... }:
{

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Justin Ang";
    userEmail = "justinray8823@gmail.com";
    ignores = [ ".DS_Store" ];

    extraConfig =
      if config.isDarwin then
        {
          init.defaultBranch = "main";
          push.autoSetupRemote = true;
          pull.ff = "only";
          core.sshCommand = "ssh";
        }
      else
        {
          init.defaultBranch = "main";
          push.autoSetupRemote = true;
          pull.ff = "only";
          core.sshCommand = "ssh.exe";
        };
  };
}
