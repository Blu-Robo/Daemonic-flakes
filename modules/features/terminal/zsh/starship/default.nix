{ self, inputs, ... }: {
  flake.nixosModules.starship = { pkgs, lib, ... }: {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        format = "[$os$username in $directory](fg:black bg:white)[   ](white)";
	right_format = "[$git_state$git_status](fg:black bg:white)";
	username = {
	  format = "[$user]($style)";
	  show_always = true;
	  disabled = false;
	  style_root = "white bold bg:purple";
	  style_user = "white bold bg:purple";
        };
	os = {
	  format = "[$symbol]($style) ";
	  disabled = false;
	  symbols = {
	    NixOS = "";
	  };
          style = "fg:#6CACE4 bg:white"; }; 
        directory = {
	  format = "[$path]($style) ";
	  style = "blue bold bg:white";
          home_symbol = "";
	};
        git_status = {
          style = "bold red bg:white";
        };
      };
    };
  };
}
