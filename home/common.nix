{ config, pkgs, ... }:
{
  imports = [
    ../modules/zsh
    ../modules/fzf
    ../modules/neovim
    ../modules/sbt
  ];
}
