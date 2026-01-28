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
in
{
  programs.vscode = {
    enable = true;
    package = if pkgs.stdenv.isLinux then vscodeNoSandbox else pkgs.vscode;
    mutableExtensionsDir = false;

    profiles.default = {
      userSettings = {
        "files.watcherExclude" = {
          "**/.bloop" = true;
          "**/.ammonite" = true;
          "**/.metals" = true;
          "**/target" = true;
        };
        "files.autoSave" = "onFocusChange";

        "terminal.integrated.fontFamily" = "MesloLGS Nerd Font Mono, MesloLGS Nerd Font, monospace";
        "terminal.integrated.fontWeight" = "normal";
        "terminal.integrated.fontSize" = 13;

        "vim.leader" = ",";
        "vim.useSystemClipboard" = true;
        "vim.normalModeKeyBindingsNonRecursive" = [
          { "before" = [ "<Space>" ]; "after" = [ ":" ]; }
          { "before" = [ "<Tab>" ]; "after" = [ "%" ]; }
          { "before" = [ "<C-h>" ]; "commands" = [ "workbench.action.focusLeftGroup" ]; }
          { "before" = [ "<C-j>" ]; "commands" = [ "workbench.action.focusBelowGroup" ]; }
          { "before" = [ "<C-k>" ]; "commands" = [ "workbench.action.focusAboveGroup" ]; }
          { "before" = [ "<C-l>" ]; "commands" = [ "workbench.action.focusRightGroup" ]; }
          { "before" = [ "d" ]; "after" = [ "\"" "_" "d" ]; }
          { "before" = [ "x" ]; "after" = [ "\"" "_" "x" ]; }
          { "before" = [ "X" ]; "after" = [ "\"" "_" "X" ]; }
          { "before" = [ "D" ]; "after" = [ "\"" "_" "D" ]; }
        ];
        "vim.visualModeKeyBindingsNonRecursive" = [
          { "before" = [ "<Space>" ]; "after" = [ ":" ]; }
          { "before" = [ "<Tab>" ]; "after" = [ "%" ]; }
          { "before" = [ "d" ]; "after" = [ "\"" "_" "d" ]; }
        ];
        "vim.insertModeKeyBindingsNonRecursive" = [
          { "before" = [ "<Up>" ]; "after" = [ ]; }
          { "before" = [ "<Down>" ]; "after" = [ ]; }
          { "before" = [ "<Left>" ]; "after" = [ ]; }
          { "before" = [ "<Right>" ]; "after" = [ ]; }
        ];
      };

      extensions = with pkgs.vscode-extensions; [
        # Java / Spring
        redhat.java
        vscjava.vscode-java-pack
        vscjava.vscode-maven
        vscjava.vscode-gradle

        # AI
        github.copilot
        github.copilot-chat
        # openai.chatgpt

        # Editor / UX
        k--kato.intellij-idea-keybindings
        vscodevim.vim

        # Nix
        jnoortheen.nix-ide

        # Containers / Remote
        ms-azuretools.vscode-containers
        ms-vscode-remote.remote-containers

        # Scala
        scala-lang.scala
        # scala-lang.scala-snippets
        scalameta.metals

        # Collaboration / Tasks
        ms-vsliveshare.vsliveshare
        # task.vscode-task

        # Data / YAML / Markdown
        mechatroner.rainbow-csv
        redhat.ansible
        redhat.vscode-yaml
        yzhang.markdown-all-in-one
      ];
    };
  };

  xdg = if pkgs.stdenv.isLinux then {
    enable = true;
    desktopEntries.vscode = {
      name = "Visual Studio Code";
      genericName = "Code Editor";
      exec = "${vscodeNoSandbox}/bin/code %F";
      tryExec = "${vscodeNoSandbox}/bin/code";
      icon = "vscode";
      type = "Application";
      categories = [ "Development" "IDE" "TextEditor" ];
      keywords = [ "vscode" "code" "editor" ];
      startupWMClass = "Code";
      terminal = false;
    };
  } else {};

  home.file.".local/share/applications/vscode.desktop" = lib.mkIf pkgs.stdenv.isLinux {
    text = ''
      [Desktop Entry]
      Name=Visual Studio Code
      GenericName=Code Editor
      Exec=${vscodeNoSandbox}/bin/code %F
      TryExec=${vscodeNoSandbox}/bin/code
      Icon=vscode
      Type=Application
      Categories=Development;IDE;TextEditor;
      Keywords=vscode;code;editor;
      StartupWMClass=Code
      Terminal=false
    '';
  };
}
