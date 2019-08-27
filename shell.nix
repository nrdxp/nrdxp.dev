let

  commitRev = "776d66ec1156f2bf88cb2a7dde5e3c51781242e2"; # 19.03-small on 2019-08-15

  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs-channels/archive/${commitRev}.tar.gz";
    sha256 = "0vyiv9vlbbqnricvzckvfsnwinv2l2s170hxb05dbd9ppwfgbm13";

  };

  pkgs = import nixpkgs { config = {}; };

in

pkgs.mkShell {

  buildInputs = [ pkgs.nixops ];

  shellHook = ''
    export NIX_PATH="nixpkgs=${nixpkgs}:."
  '';

}
