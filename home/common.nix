{ config, pkgs, ... }:
{
  imports = [
    ../modules/zsh
    ../modules/git
    ../modules/fzf
    ../modules/neovim
    ../modules/sbt
    ../modules/bash
    ../modules/bat
    ../modules/ansible
    ../modules/eza
    ../modules/ripgrep
    ../modules/vscode
  ];
}
