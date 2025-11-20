{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    {
      packages.aarch64-linux = nixpkgs.lib.packagesFromDirectoryRecursive {
        inherit (nixpkgs.legacyPackages.aarch64-linux) callPackage newScope;
        directory = ./packages;
      };
    };
}
