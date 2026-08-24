{ self, inputs, ... }: {
  flake.nixosConfigurations.daemonic-framework = inputs.nixpkgs.lib.nixosSystem {
    modules = (with self.nixosModules; [
      desktop
      daemonic-framework-configuration
      dev
      terminal
      school
    ]) ++ [
      inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    ];
  };
}
