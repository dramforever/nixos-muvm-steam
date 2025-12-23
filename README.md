# nixos-muvm-steam

*No, you don't have to cross compile Mesa.*

## Nix Flake

This repository contains a Nix Flake. To use it, use the following flake URL:

```plain
github:dramforever/nixos-muvm-steam
```

## Non-flake usage

```nix
import ./path/to/nixos-muvm-steam { pkgs = /* ... */; }
```

## What is this?

A wrapper script for the muvm+FEX stack to run Steam and Steam games on Asahi Linux NixOS.

## Usage

1. Download and unpack the latest `steam_{version}.tar.gz` from https://repo.steampowered.com/steam/archive/stable/
2. Run `muvm-steam`

  ```console
  $ nix run --always-allow-substitutes .#muvm-steam
  ```

  (The `--always-allow-substitutes` forces Nix to download `steam-run-free` even though it is ordinarily less efficient than building, to avoid having to run `x86_64-linux` builds.)

3. Follow the instructions inside to run Steam itself.

## What's working and what's not

- [X] muvm (0.5.0)
- [X] FEX (upstream Nixpkgs)
- [X] Mesa (upstream Nixpkgs)
- [X] Steam (PulseAudio workaround)
- [X] At least some Windows games on Steam
- [ ] Library forwarding
