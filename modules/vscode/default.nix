{ pkgs, lib, ... }:
let
  vscodeNoSandbox = pkgs.symlinkJoin {
    pname = "vscode";
    version = pkgs.vscode.version;
    name = "vscode-no-sandbox";
    paths = [ pkgs.vscode ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/code --add-flags "--no-sandbox"
    '';
  };

  codeDesktopEntryIni = {
    Name = "Visual Studio Code";
    GenericName = "Code Editor";
    Exec = "${vscodeNoSandbox}/bin/code %F";
    TryExec = "${vscodeNoSandbox}/bin/code";
    Icon = "${vscodeNoSandbox}/share/icons/hicolor/1024x1024/apps/vscode.png";
    Type = "Application";
    Categories = "Development;IDE;TextEditor;";
    Keywords = "vscode;code;editor;";
    StartupWMClass = "Code";
    Terminal = "false";
  };

in
{
  programs.vscode = {
    enable = true;
    package = if pkgs.stdenv.isLinux then vscodeNoSandbox else pkgs.vscode;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = import ./userSettings.nix;
      extensions = import ./extensions.nix { inherit pkgs; };
    };
  };

  home.file.".local/share/applications/code.desktop" = lib.mkIf pkgs.stdenv.isLinux {
    text = lib.generators.toINI {} { "Desktop Entry" = codeDesktopEntryIni; };
  };
}
