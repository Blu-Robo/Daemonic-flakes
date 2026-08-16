{ self, inputs, ... }: { 
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };
  perSystem = { pkgs, lib, ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;	
      settings = {
	layout.gaps = 5;
	input = {
          focus-follows-mouse = {};
	  touchpad = {
	    natural-scroll = {};
	  };
	};
	spawn-at-startup = [
	  "${lib.getExe pkgs.dms-shell} run"
	  "zen"
	];
	binds = {
	  "Mod+Q".spawn-sh = lib.getExe pkgs.kitty;
	  "Mod+C".close-window = {};
	  "XF86MonBrightnessUp".spawn-sh = "${pkgs.brightnessctl}/bin/brightnessctl set 5%+";
	  "XF86MonBrightnessDown".spawn-sh = "${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
	};
      };
    };
  };
}
