{
  pkgs,
  lib,
  ...
}: let
  pname = "download_cleaner";
  platform = pkgs.makeRustPlatform {
    inherit (pkgs) cargo rustc;
  };
in
  platform.buildRustPackage {
    inherit pname;
    version = "0-unstable-2025-02-13";

    src = pkgs.fetchFromGitHub {
      owner = "uekann";
      repo = pname;
      rev = "39dd03698898fdf193cbba4d34751359a3877b57";
      hash = "sha256-oz2jrgt3iNJUBw2G3FySFRDlQP+hdLYfVBg0nuqEr0w=";
    };

    cargoHash = "sha256-rTq6bO2074bduHPGn19wRNhkT2Yg9MdA5oY4SoUn+Vg=";

    meta = {
      description = "Keep your Downloads folder tidy";
      license = lib.licenses.unlicense;
      homepage = "https://github.com/uekann/download_cleaner";
      platforms = lib.platforms.darwin;
      maintainers = with lib.maintainers; [momeeemt];
    };
  }
