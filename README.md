# Dotfiles (Nix Flakes)

This repository manages my user environment and apps with Nix flakes and Home Manager. It is designed for a Linux machine today, with a macOS host ready to enable later.

## What this repo does

- Declares user-level configuration (shell, editor, tools) with Home Manager.
- Keeps reusable app modules in `modules/`.
- Splits shared config vs. OS-specific config.
- Uses a flake for reproducible inputs.

## Repository layout

```
flake.nix               # Flake entry point
bootstrap               # One-command bootstrap for Linux
home/                   # Shared + OS-specific Home Manager modules
  common.nix
  linux.nix
  darwin.nix
hosts/                  # Host/OS entry points
  personal-desktop-linux/default.nix
  personal-laptop-mac/default.nix
modules/                # Reusable app modules (zsh, fzf, neovim, sbt, ...)
legacy/                 # Previous non-flake layout (archived)
```

## Prerequisites

- Nix installed (package manager only, not NixOS).
- Git (for flakes to read `flake.nix`).

## Quick start (Linux)

1) Clone this repo.
2) Run the bootstrap script with a flake target:

```
./bootstrap alvaro@personal-desktop-linux
```

What it does:
- Ensures flakes are enabled in `~/.config/nix/nix.conf`.
- Runs Home Manager for the given target (for example `alvaro@personal-desktop-linux`) and backs up any clobbered files with a `.backup` suffix.

## Manual run (Linux)

```
NIX_CONFIG="experimental-features = nix-command flakes" \
  nix run github:nix-community/home-manager -- switch --flake .#alvaro@personal-desktop-linux
```

## macOS (future)

The flake already includes a macOS target:

```
.#alvaro@personal-laptop-mac
```

You can enable it later by installing Nix and running the same Home Manager command with that target.

## Common changes

- Add a new app module: create `modules/<app>/default.nix` and import it in `home/common.nix`.
- Add Linux-only tweaks: edit `home/linux.nix`.
- Add macOS-only tweaks: edit `home/darwin.nix`.
- Add packages to an app module or create a new module and import it.

## Notes

- `flake.nix` is the entry point and must be tracked by Git for flakes to work.
- `legacy/` contains the previous layout and is not used by the flake.
