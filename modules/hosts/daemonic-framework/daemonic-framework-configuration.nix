{ ... }: {
  flake.nixosModules.daemonic-framework-configuration = { pkgs, ... }: {
    networking = {
      hostName = "daemonic-machine";
    };
    services.fprintd = {
      enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };
  };
}
