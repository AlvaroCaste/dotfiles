{ config, pkgs, ... }:
{

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  imports = [
    ../../applications/zsh
    ../../applications/fzf
    ../../applications/neovim
  ];

  home.packages = with pkgs; [
    bat
    git
  ];
}
