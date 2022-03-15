{ config, pkgs, ... }:
{

  home.packages = [ pkgs.zsh pkgs.zsh-powerlevel10k ];

  programs.zsh = {
    enable = true;
    plugins = [{
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" "vi-mode"];
  };

}
