{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      if [[ $- == *i* ]] && command -v zsh >/dev/null 2>&1; then
        exec zsh
      fi
    '';
  };
}
