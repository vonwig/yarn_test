{
  description = "Example of a project that integrates nix flake with yarn.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        node-modules = pkgs.mkYarnPackage {
          name = "node-modules";
          src = ./.;
        };
        frontend = pkgs.stdenv.mkDerivation {
          name = "frontend";
          src = ./.;
          buildInputs = [pkgs.yarn node-modules];
          buildPhase = ''
            ln -s ${node-modules}/libexec/yarn-nix-example/node_modules node_modules
            ${pkgs.yarn}/bin/yarn build
          '';
          installPhase =  ''
          mkdir $out
          mv dist $out/lib
          '';

        };
      in 
        {
          devShells = {
            default = pkgs.mkShell {
              buildInputs = [pkgs.yarn pkgs.nodejs];
            };
          };
          packages = {
            #node-modules = node-modules;
            #default = frontend;
          };
        }
    );
}


