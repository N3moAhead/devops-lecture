# devops-lecture

A simple "Hello, Friends!" application written in Zig.

This project is configured with a `Makefile` for common tasks and a `flake.nix` for setting up a reproducible development environment.

## Prerequisites

- [Zig](https://ziglang.org/)
- [Make](https://www.gnu.org/software/make/)

Alternatively, if you have [Nix](https://nixos.org/) installed with flakes enabled, you can just enter the development environment.

## Building and Running

### Using Make

- **Build:** `make build`
  - This will create the executable at `zig-out/bin/devops-lecture`.
- **Run:** `make run`
  - This will build and run the application.
- **Test:** `make test`
  - This will run the tests.
- **Clean:** `make clean`
  - This will remove build artifacts.

### Using Nix

- **Enter Dev Shell:** `nix develop`
  - This will drop you into a shell with Zig and Make available.
- **Build within Nix:** `nix build`
  - This will build the project and create a `result` symlink to the output in the Nix store.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
