{ self, inputs, ... }: {
  flake.nixosModules.network = { pkgs, lib, ... }: {
    networking = {
      networkmanager = {
        enable = true;
	dns = "none";
      };
      wireless.enable = true;
      nameservers = [
        "1.1.1.1"
	"8.8.8.8"
      ];
      firewall.enable = false;
    };
    services.unbound = {
      enable = true;
    };
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
