{ network.description = "nrdxp.dev";

  nrdxp =
  { pkgs, ... }:
  { imports = [
    <nixpkgs/nixos/modules/profiles/hardened.nix>
    <nixpkgs/nixos/modules/profiles/headless.nix>
    <nixpkgs/nixos/modules/profiles/minimal.nix>
    ];

    # conflicts with hardened profile
    nix.useSandbox = false;
  };
}
