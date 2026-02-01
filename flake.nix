{
  description = "Dotfiles and apps managed with Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-latest.url = "github:NixOS/nixpkgs/master";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-latest, nix-vscode-extensions, home-manager, nix-darwin, ... }:
    let
      mkPkgs = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      mkLatestPkgs = system: import nixpkgs-latest {
        inherit system;
        config.allowUnfree = true;
        overlays = [ nix-vscode-extensions.overlays.default ];
      };

      mkBaseModule = { username, homeDirectory }: {
        home.username = username;
        home.homeDirectory = homeDirectory;
        home.stateVersion = "24.05";
        programs.home-manager.enable = true;
        nixpkgs.config.allowUnfree = true;
      };

      mkHome = { system, username, homeDirectory, modules }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = mkPkgs system;
          extraSpecialArgs = {
            latestPkgs = mkLatestPkgs system;
          };
          modules = modules ++ [ (mkBaseModule { inherit username homeDirectory; }) ];
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
