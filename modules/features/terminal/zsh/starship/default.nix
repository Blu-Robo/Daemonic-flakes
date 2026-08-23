{ self, inputs, ... }: {
  flake.nixosModules.starship = { pkgs, lib, ... }: {
    programs.starship = {
      enable = true;
      settings = {
        add_newline = true;
        format = "$os$username$directory";
	right_format = "$git_branch$git_commit$git_state$git_status";
      };
    };
  };
}
