{ latestPkgs, ... }:
{
  programs.fzf = {
    enable = true;
    package = latestPkgs.fzf;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;

    defaultOptions = [ "--height 20%" "--border" "--reverse" ];

    defaultCommand = "rg --files --hidden --no-ignore-vcs";
  };
}
