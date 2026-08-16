{ self, inputs, ... }: {
  flake.nixosModules.core = { pkgs, lib, ... }: let
    modules = with self.nixosModules; [
      user
      nix
      locale
      bootloader
      network
    ];
  in {
    imports = 
      [
        /etc/nixos/hardware-configuration.nix
      ]
      ++modules;
    services = {
      openssh.enable = true;
    };
    environment.systemPackages = with pkgs; [
      wget
    ];
    system.stateVersion = "26.05";
  };
}
