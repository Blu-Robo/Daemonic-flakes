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
      firewall = {
        enable = false;
        checkReversePath = false;
      };
    };
    services.unbound = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      wireguard-tools
      proton-vpn
    ];
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
