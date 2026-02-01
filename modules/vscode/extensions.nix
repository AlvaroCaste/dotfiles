{ latestPkgs }:
with latestPkgs.vscode-marketplace; [
  # Java / Spring
  redhat.java
  vscjava.vscode-java-pack
  vscjava.vscode-maven
  vscjava.vscode-gradle

  # AI
  github.copilot
  github.copilot-chat
  openai.chatgpt

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
  scala-lang.scala-snippets
  scalameta.metals

  # Collaboration / Tasks
  ms-vsliveshare.vsliveshare
  task.vscode-task

  # Data / YAML / Markdown
  mechatroner.rainbow-csv
  redhat.ansible
  redhat.vscode-yaml
  yzhang.markdown-all-in-one
]
