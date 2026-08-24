{ self, inputs, ... }: {
  flake.nixosModules.school = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
