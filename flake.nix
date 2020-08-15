{
  description = "Rust jsonnet implementation";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        jrsonnet = pkgs.rustPlatform.buildRustPackage rec {
          pname = "jrsonnet";
          version = "0.1.0";
          src = self;
          cargoSha256 = "13fc96lvcg8riv8s8k44nshyc9jj390x5wmizfplny8lrxcr14lk";
        };
      in { defaultPackage = jrsonnet; });
}