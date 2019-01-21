{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  test = (
    with rec {
      testSource = pkgs.lib.cleanSource ../.;
      testBasic  = self.callCabal2nix "test" testSource { };
    };
    overrideCabal testBasic (old: {
    })
  );
}
