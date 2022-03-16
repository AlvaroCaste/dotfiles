{ config, pkgs, ... }:

let
  jdk = pkgs.jdk11;
in
{
  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  imports = [
    ../../applications/zsh
    ../../applications/fzf
    ../../applications/neovim
    ../../applications/sbt
  ];

  programs.java = {
    enable = true;
    package = jdk;
  };

  home.packages = with pkgs; [
    bat
    git
    (ammonite_2_13.override { jre = jdk; })
  ];
}
