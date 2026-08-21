{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.kitty = moduleWithSystem (
    {self'}: {
      environment.systemPackages = with self'.packages; [
        kitty
      ];
    }
  );
  perSystem = { pkgs, ... }: {
    packages.kitty = let 
      jetbrains-mono = pkgs.nerd-fonts.jetbrains-mono;
      fontsConf = pkgs.makeFontsConf {
        fontDirectories = [jetbrains-mono];
      };
    in
      inputs.wrapper-modules.wrappers.kitty.wrap {
        inherit pkgs;
	environment = {
	  "FONTCONFIG_FILE" = "${fontsConf}";
	};
	font = {
	  name = "JetBrainsMono Nerd Font Mono";
	  size = 12;
	};
	settings = {
	  font_size = 12;

	  disable_ligatures = "never";

	  cursor_shape = "block";
	  cursor_blink_interval = 0.75;
	  cursor_stop_blinking_after = 10.0;
	  
	  scrollbar = "hovered";
	  scrollbar_width = 1.5;
	  scrollbar_gap = 0.5;
	  scrollbar_hitbox_expansion = 1.0;
	  scrollbar_radius = .50;

	  url_style = "double";

	  show_hyperlink_targets = true;
	  copy_on_select = true;
	  strip_trailing_spaces = "smart";

	  enable_audio_bell = false;
	  
	  confirm_os_window_close = 0;
	};
      };
  };
}
