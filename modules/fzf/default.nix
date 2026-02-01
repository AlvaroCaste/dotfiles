{ latestPkgs, ... }:
{
  programs.fzf = {
    enable = true;
    package = latestPkgs.fzf;
    enableZshIntegration = true;
    enableBashIntegration = false;
    enableFishIntegration = false;

    defaultOptions = [
      "--height 20%"
      "--border"
      "--reverse"
      "--preview 'bat --style=numbers --color=always --line-range :200 {}'"
      "--preview-window=right,60%"
    ];

    defaultCommand = "rg --files --hidden --no-ignore-vcs";
  };
}
