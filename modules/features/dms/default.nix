{ self, inputs, ... }: {
	flake.nixosModules.dms = { pkgs, lib, ... }: {
		programs.dms-shell = {
			enable = true;
		};
	};
}

