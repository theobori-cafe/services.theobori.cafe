{
  lib,
  stdenv,
  hugo,
  fetchFromGitHub,
}:
let
  cupper = fetchFromGitHub {
    owner = "zwbetz-gh";
    repo = "cupper-hugo-theme";
    rev = "387d905ae4517dacf698a238b71221a84d2f6e9c";
    hash = "sha256-Tg/5MmzLcuTVFLWhJMrlE5awANAHr3sqJnrhV6WDPOU=";
  };
in
stdenv.mkDerivation (finalAttrs: {
  pname = "services-theobori-cafe";
  version = "0.0.1";

  src = ./.;

  nativeBuildInputs = [
    hugo
  ];

  preBuild = ''
    mkdir -p themes
    ln -s ${cupper} themes/cupper-hugo-theme
  '';

  buildPhase = ''
    runHook preBuild

    hugo

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mv public $out

    runHook postInstall
  '';

  meta = {
    description = "My website introducing my free services open to all";
    license = lib.licenses.mit;
  };
})
