{ nrdxp =
  { pkgs, ... }:
  let site = import ../site.nix { stdenv = pkgs.stdenv; };
  in
  { deployment.targetEnv = "libvirtd";
    networking.firewall.allowedTCPPorts = [ 22 80 ];
    containers.webserver =
    { autoStart = true;
      config =
      { services.lighttpd =
        { enable = true;
          port = 80;
          document-root = "${site}/www";
          enableModules = [];
          extraConfig = import ../lighttpd/test.nix {};
        };
      };
    };
  };
}
