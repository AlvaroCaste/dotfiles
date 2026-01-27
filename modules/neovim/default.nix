{ config, pkgs, ... }:
{

  home.file.".vimrc".source = ./vimrc;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
        set runtimepath^=~/.vim runtimepath+=~/.vim/after
      let &packpath=&runtimepath
      source ~/.vimrc
    '';
  };

}
