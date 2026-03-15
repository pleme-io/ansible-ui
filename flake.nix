{
  description = "Ansible UI - web interface for AWX, Automation Hub, and Event-Driven Ansible";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          nodejs_22
          python3
        ];
      };
    });
}
