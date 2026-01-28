{ pkgs }:
let
  openaiChatgptExt = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "chatgpt";
      publisher = "openai";
      version = "0.4.67";
      sha256 = "0l1mcfbcckahc6h7wfihd6mm93civrscw4zbfa8rd7vqk07y3d7b";
    }
  ];
in
with pkgs.vscode-extensions; [
  # Java / Spring
  redhat.java
  vscjava.vscode-java-pack
  vscjava.vscode-maven
  vscjava.vscode-gradle

  # AI
  github.copilot
  github.copilot-chat

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
] ++ openaiChatgptExt
