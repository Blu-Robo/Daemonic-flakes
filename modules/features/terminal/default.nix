{ self, moduleWithSystem, ... }: {
  flake.nixosModules.terminal = moduleWithSystem ({ pkgs, ... }: let 
    modules = with self.nixosModules; [
      kitty
      zsh
      starship
    ];
  in {
    imports = modules;
  });
}
