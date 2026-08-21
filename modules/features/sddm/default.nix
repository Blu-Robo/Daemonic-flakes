{ self, inputs, ... }: {
	flake.nixosModules.sddm = {pkgs, lib, ... }: {
		services.displayManager = {
			sddm = {
				enable = true;
				wayland.enable = true;
			};
			defaultSession = "niri";
		};
	};
}
