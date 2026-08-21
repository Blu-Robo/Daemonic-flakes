{ self, moduleWithSystem, ... }: {
  flake.nixosModules.desktop = moduleWithSystem ({ pkgs, ... }: let
    modules = with self.nixosModules; [
      core
      niri
      greetd
      #dms
    ];
  in {
    imports = modules;
  });
}
