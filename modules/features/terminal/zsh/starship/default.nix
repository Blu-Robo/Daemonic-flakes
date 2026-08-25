{ self, inputs, ... }: {
  flake.nixosModules.starship = { pkgs, lib, ... }: {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        format = "$os$username$directory";
	right_format = "$git_branch$git_commit$git_state$git_status";
	username = {
	  format = "[$user]($style) ";
	  show_always = true;
	  disabled = false;
	  style_root = "red bold bg:0x9A348E";
	  style_user = "yellow bold bg:0x9A348E";
        };
	os = {
	  format = "[$symbol]($style) ";
	  disabled = false;
	  symbols = {
	    NixOS = "";
	  };
	};
	directory = {
	  format = "[$path]($style) ";
	  style = "cyan bold";
	};
      };
    };
  };
}
