{ self, moduleWithSystem, ... }: {
  flake.nixosModules.terminal = moduleWithSystem ({ pkgs, ... }: let 
    modules = with self.nixosModules; [
      kitty
      zsh
    ];
  in {
    imports = modules;
  });
}
