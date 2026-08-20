{ self, inputs, ... }: {
  flake.nixosConfigurations.daemonic-framework = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      desktop
      daemonic-framework-configuration
      dev
      kitty
    ];
  };
}
