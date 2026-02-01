{ config, lib, pkgs, ... }:
{

  home.packages = [
    pkgs.zsh
    pkgs.zsh-powerlevel10k
    pkgs.nerd-fonts."meslo-lg"
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = { 
      # zsh-vi-mode init strategy
      ZVM_INIT_MODE = "sourcing"; 
      # autosuggestion highlight color
      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=2";
    };

    shellAliases = {
      cat = "bat";
      grep = "rg --color=auto";
    };

    history = {
      size = 100000;
      save = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      extended = true;
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
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
      {
        name = "zsh-history-substring-search";
        src = pkgs.zsh-history-substring-search;
        file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh";
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
    ];
  };
}
