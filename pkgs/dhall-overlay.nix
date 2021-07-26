let
    dhallOverlay =
      self: super: {
        dhall = builtins.fetchTarball
            "https://github.com/dhall-lang/dhall-haskell/releases/download/1.30.0/dhall-1.30.0-x86_64-linux.tar.bz2";
          };
in
  {
    pkgs ? import <nixpkgs> {
      config = {};
      overlays =
        [
          # ankiOverlay
          dhallOverlay
          # keepassOverlay
        ];
    }
  }:

  pkgs.mkShell
  { buildInputs = [
    # pkgs.anki
    pkgs.dhall
    # pkgs.keepass_new 
  ]; }

