{ self, inputs, ... }: {
  flake.nixosModules.bootloader = { pkgs, lib, ... }: {
    boot = {
      loader = {
        timeout = 10;
	efi = {
	  canTouchEfiVariables = true;
	};
	grub = {
	  efiSupport = true;
	  device = "nodev";
	};
      };
      plymouth = {
        enable = true;
      };
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
