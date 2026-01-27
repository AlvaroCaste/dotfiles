{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      lualine-nvim # statusline
      nvim-tree-lua # file tree explorer
      nvim-web-devicons # file icons for tree/statusline
      gitsigns-nvim # git diff signs in the gutter
      indent-blankline-nvim # indent guides
      nvim-treesitter # treesitter (no markdown parsers)
    ];
    initLua = builtins.readFile ./init.lua;
  };
}
