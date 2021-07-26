# let
#     dhallOverlay =
#       self: super: {
#         dhall = builtins.fetchTarball
#             "https://github.com/dhall-lang/dhall-haskell/releases/download/1.30.0/dhall-1.30.0-x86_64-linux.tar.bz2";
#           };
# in
#   {
#     pkgs ? import <nixpkgs> {
#       config = {};
#       overlays =
#         [
#           # ankiOverlay
#           dhallOverlay
#           # keepassOverlay
#         ];
#     }
#   }:
# 
#   pkgs.mkShell
#   { buildInputs = [
#     # pkgs.anki
#     pkgs.dhall
#     # pkgs.keepass_new 
#   ]; }
# 
# Errors occurred at 2021-07-26 15:05:04.
# 
# in job ‘dhall-overlay’:
# error: In /nix/store/fcydk2r1x36q2dqb1yk03aynszwk4q85-source/pkgs/dhall-overlay.nix, the argument "pkgs" has a default value (`pkgs ? <default>`) which is not allowed because the attribute "pkgs" exists in the environment, therefore overriding the default value.
#        If "pkgs" should be a package configuration, changeable via `.override { pkgs = <value>; }`, rename the argument to something that doesn't already exist
#        If "pkgs" should be optional dependency (commonly done with `pkgs ? null`), remove the default value

let
    dhallOverlay =
      self: super: {
        dhall = builtins.fetchTarball
            "https://github.com/dhall-lang/dhall-haskell/releases/download/1.30.0/dhall-1.30.0-x86_64-linux.tar.bz2";
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
  pkgs.mkShell { buildInputs = [ overlayPkgs.dhall ]; }
