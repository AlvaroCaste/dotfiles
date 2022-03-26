{ config, lib, pkgs, ... }:
{

  home.packages = [ pkgs.zsh pkgs.zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    initExtra = ''
      # zsh-vi-mode plugin
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';

    sessionVariables = {
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=2";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ 
      "aws"
      "git"
      "sudo"
      "docker"
      "docker-compose"
      "kubectl"
      "virtualenvwrapper"
    ];
  };
}
