{ self, inputs, ... }: {
  flake.nixosModules.user = { pkgs, lib, ... }: let
    modules = with self.nixosModules; [
    ];
  in {
    imports = modules;
    users.users.blu_robo = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "root" "wheel" ];
    };
  };
}
    
