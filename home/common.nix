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
    ../modules/eza
    ../modules/ripgrep
    ../modules/vscode
  ];
}
