{ config, pkgs, ... }:
{
  imports = [
    ../modules/zsh
    ../modules/fzf
    ../modules/neovim
    ../modules/sbt
    ../modules/bash
    ../modules/tools
    ../modules/vscode
  ];
}
