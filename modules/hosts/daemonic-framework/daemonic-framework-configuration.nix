{ ... }: {
  flake.nixosModules.daemonic-framework-configuration = { pkgs, ... }: {
    networking = {
      hostName = "daemonic-machine";
    };
  };
}
