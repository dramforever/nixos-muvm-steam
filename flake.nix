{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    {
      packages.aarch64-linux = import ./. {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
      };
    };
}
