{
  description = "A Zig project with Makefile support";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          default = pkgs.stdenv.mkDerivation {
            pname = "zig-app";
            version = "0.1.0";

            src = ./.;

            nativeBuildInputs = [ pkgs.zig pkgs.gnumake ];

            buildPhase = ''
              make build
            '';

            installPhase = ''
              mkdir -p $out/bin
              install -m 755 main $out/bin/zig-app
            '';

            meta = with pkgs.lib; {
              description = "A simple Zig application";
              license = licenses.mit;
              platforms = platforms.all;
            };
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            zig
            gnumake
            zls  # Zig Language Server
          ];

          shellHook = ''
            echo "Zig development environment"
            echo "Zig version: $(zig version)"
            echo ""
            echo "Available commands:"
            echo "  make build  - Build the project"
            echo "  make run    - Build and run"
            echo "  make test   - Run tests"
            echo "  make clean  - Clean build artifacts"
            echo "  make help   - Show all make targets"
          '';
        };
      }
    );
}
