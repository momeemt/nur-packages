{pkgs}: {
  lib = import ./lib {
    inherit pkgs;
  };
  modules = import ./modules;
  overlays = import ./overlays;

  aicommit = pkgs.callPackage ./pkgs/aicommit {};
}
