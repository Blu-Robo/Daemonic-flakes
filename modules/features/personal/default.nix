{ self, inputs, ... }: {
  flake.nixosModules.personal = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      shotcut
      vesktop
    ];
  };
}
