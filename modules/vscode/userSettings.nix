{
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
}
