{ self, inputs, ... }: {
  flake.nixosModules.school = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
    services = {
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      printing.enable = true;
    };
  };
}
