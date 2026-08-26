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
	  shell = "zsh";
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

          # color scheme
          
          # bg/fg
          background =                  "#09000e";
          foreground =                  "#dac3f9";
          
          # scrollbar
          scrollbar_handle_color =      "#f4b7ba";
          scrollbar_track_color =       "#4c2528";

          # cursor
          cursor =                      "#cc5cd6";
          selection_background =        "#9b67e4";
          selection_foreground =        "#2f1a4c";

          # background                  "black"
          color0 =                      "#09000e";
          color8 =                      "#6006b3";

          # error                       "red"
          color1 =                      "#fd4663";
          color9 =                      "#fd0f35";

          # success                     "green"
          color2 =                      "#14a464";
          color10 =                     "#20e48c";

          # warning                     "yellow"
          color3 =                      "#9f7913";
          color11 =                     "#e5b124";

          # directory                   "blue"
          color4 =                      "#13389f";
          color12 =                     "#2458e5";

          # keywords                    "magenta"
          color5 =                      "#a31c8b";
          color13 =                     "#d826b8";

          # paths                       "cyan"
          color6 =                      "#2e8a8d";
          color14 =                     "#5ac5ca";

          # foreground                  "white"
          color7 =                      "#dac3f9";
          color15 =                     "#ffffff";
	};

      };
  };
}
