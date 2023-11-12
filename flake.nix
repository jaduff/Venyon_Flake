{
  description = "JavaScript example flake for Zero to Nix";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2305.491812.tar.gz";
  };

  outputs = { self, nixpkgs }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

veyon = (with pkgs; stdenv.mkDerivation{
      pname = "veyon"
      version = "4.8"
      src = fetchgit {
        url ="github:veyon/veyon/4.8";
        rev = "4.8";
        sha256 = "";
        fetchSubmodules = true;
        };
        nativeBuildInputs = [
          clang
          cmake
];
buildphase = "cd build; cmake ..; make -j4"
installPhase = '';
})
}
