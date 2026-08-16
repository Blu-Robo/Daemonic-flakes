{ self, moduleWithSystem, ... }: {
  flake.nixosModules.desktop = moduleWithSystem ({ pkgs, ... }: let
    modules = with self.nixosModules; [
      core
      niri
      sddm
      dms
    ];
  in {
    imports = modules;
  });
}
