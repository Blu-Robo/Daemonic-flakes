{ self, inputs, ... }: {
  flake.nixosModules.personal = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      davinci-resolve
      discord
    ];
  };
}
