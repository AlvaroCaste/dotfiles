{
  description = "Dotfiles and apps managed with Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... }:
  let
    mkHome = { system, username, homeDirectory, modules }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = modules ++ [
          {
            home.username = username;
            home.homeDirectory = homeDirectory;
            home.stateVersion = "24.05";
            programs.home-manager.enable = true;
            nixpkgs.config.allowUnfree = true;
          }
        ];
      };
  in
  {
    homeConfigurations = {
      "alvaro@personal-desktop-linux" = mkHome {
        system = "x86_64-linux";
        username = "alvaro";
        homeDirectory = "/home/alvaro";
        modules = [ ./hosts/personal-desktop-linux/default.nix ];
      };

      "alvaro@personal-laptop-mac" = mkHome {
        system = "aarch64-darwin";
        username = "alvaro";
        homeDirectory = "/Users/alvaro";
        modules = [ ./hosts/personal-laptop-mac/default.nix ];
      };
    };
  };
}
