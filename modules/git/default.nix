{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user.name = "Álvaro Castellanos López";
      user.email = "alvaro.castellanos.lopez@proton.me";

      core = {
        editor = "${pkgs.neovim}/bin/nvim +startinsert!";
        autocrlf = "input";
        whitespace = "trailing-space,blank-at-eol,tabs-in-indent";
      };

      pull.ff = "only";

      push = {
        default = "simple";
        autoSetupRemote = true;
      };

      fetch.prune = "true";

      color.ui = "auto";
    };

    includes = [
      {
        path = "~/workspaces/.gitconfig";
        condition = "gitdir:~/workspaces/";
      }
    ];

    ignores = [
      # Mac OSX
      ".DS_Store"

      # Metals
      ".metals/"
      ".bloop/"
      "project/metals.sbt"
      ".bsp/"

      # Editors
      ".idea/"
      ".vscode/"
    ];
  };

  programs.diff-so-fancy = {
    enable = true;
    enableGitIntegration = true;
  };

  home.packages = with pkgs; [
    gh
  ];
}
