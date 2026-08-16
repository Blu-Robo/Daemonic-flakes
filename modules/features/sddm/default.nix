{ self, inputs, ... }: {
	flake.nixosModules.sddm = {pkgs, lib, ... }: {
		services.displayManager = {
			sddm = {
				enable = true;
				wayland.enable = true;
			};
		#	autoLogin = {
		#		enable = true;
		#		user = "blu_robo";
		#	};
			defaultSession = "niri";
		};
		services.fprintd.enable = true;
	};
}
