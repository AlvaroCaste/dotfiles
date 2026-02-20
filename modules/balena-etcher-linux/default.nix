{ pkgs, lib, ... }:
let
  balenaEtcherDeb = pkgs.fetchurl {
    url = "https://github.com/balena-io/etcher/releases/download/v2.1.4/balena-etcher_2.1.4_amd64.deb";
    sha256 = "0lljbv97p3qsh4i6dlivzn9hczfv3b6ijs03pj4vfkkjn0xj2df6";
  };

  balenaEtcher = pkgs.stdenvNoCC.mkDerivation {
    pname = "balena-etcher";
    version = "2.1.4";
    src = balenaEtcherDeb;
    nativeBuildInputs = [ pkgs.gnutar pkgs.zstd pkgs.binutils pkgs.makeWrapper ];

    unpackPhase = ''
      ar p "$src" data.tar.zst | tar --zstd -x
    '';

    installPhase = ''
      mkdir -p "$out"
      cp -r usr/* "$out/"
      rm -f "$out/bin/balena-etcher"
      makeWrapper "$out/lib/balena-etcher/balena-etcher" "$out/bin/balena-etcher" \
        --add-flags "--no-sandbox"
    '';
  };

  balenaEtcherDesktopEntryIni = {
    Name = "balenaEtcher";
    GenericName = "balenaEtcher";
    Comment = "Flash OS images to SD cards and USB drives, safely and easily.";
    Exec = "${balenaEtcher}/bin/balena-etcher %U";
    TryExec = "${balenaEtcher}/bin/balena-etcher";
    Icon = "${balenaEtcher}/share/pixmaps/balena-etcher.png";
    Type = "Application";
    Categories = "Utility;";
  };
in
{
  home.packages = [
    balenaEtcher
  ];

  home.file.".local/share/applications/balena-etcher.desktop" = {
    text = lib.generators.toINI {} { "Desktop Entry" = balenaEtcherDesktopEntryIni; };
  };
}
