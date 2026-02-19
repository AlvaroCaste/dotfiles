{ pkgs, ... }:
{
  home.packages = [
    pkgs.ansible
  ];

  home.file.".ansible.cfg".text = ''
    [defaults]
    inventory = ~/.ansible/hosts
  '';

  home.file.".ansible/hosts".text = ''
    # Add your inventory here.
  '';
}
