{ self, inputs, ... }: {
  flake.nixosModules.starship = { pkgs, lib, ... }: {
    programs.starship = {
      enable = true;
      settings = {
	format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
      };
    };
  };
}
