{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

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

  imports = [
    ../../applications/zsh
    ../../applications/fzf
  ];

  home.packages = with pkgs; [
    bat
    git
  ];
}
