{ self, inputs, ... }: {
  flake.nixosModules.greetd = { pkgs, lib, ... }: {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
	  command = "${lib.getExe pkgs.cage} -s -mlast -d -- ${lib.getExe pkgs.regreet}";
	  user = "greeter";
	};
      };
    };
    programs.regreet = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
	package = pkgs.gnome-themes-extra;
      };
    };
  };
}
