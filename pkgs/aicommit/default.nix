{
  pkgs,
  lib,
  ...
}: let
  pname = "aicommit";
  version = "0.6.5";
in
  pkgs.buildGoModule {
    inherit pname version;

    src = pkgs.fetchFromGitHub {
      owner = "coder";
      repo = pname;
      tag = "v${version}";
      hash = "sha256-GMtl6GcpWhnK3zo8ur8XzF6gMjJHrPpvVeQ9zTsWpcg=";
    };

    vendorHash = "sha256-bZQ0XAbyIr44NZko6O7SkUJBa3rkwblBsSU2jnak/+0=";

    patchPhase = ''
      runHook prePatch
      substituteInPlace cmd/aicommit/main.go \
        --replace-fail 'if resp.Usage != nil {' 'if false && resp.Usage != nil {'
      runHook postPatch
    '';

    meta = {
      description = "Become the world's laziest committer";
      homepage = "https://github.com/coder/aicommit";
      license = lib.licenses.cc0;
      maintainers = with lib.maintainers; [momeemt];
    };
  }
