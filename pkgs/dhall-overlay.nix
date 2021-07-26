let
    dhallOverlay =
      self: super: {
        dhall = builtins.fetchTarball
            "https://github.com/dhall-lang/dhall-haskell/releases/download/1.39.0/dhall-1.39.0-x86_64-linux.tar.bz2";
          };

    overlayPkgs =
      import <nixpkgs> {
        config = {};
        overlays =
          [
            dhallOverlay
          ];
      };
in
  # overlayPkgs.mkShell { buildInputs = [ overlayPkgs.dhall ]; }

  stdenv.mkDerivation {
    name = "dhall";
    buildInputs = [ overlayPkgs.dhall ];
  }
