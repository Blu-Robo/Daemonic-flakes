{ self, inputs,  ... }: {
  flake.nixosModules.git = { pkgs, lib, ... }: {
    programs.git = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.git;
    };
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-all;
    };
    programs.ssh = {
      startAgent = true;
      extraConfig = "AddKeysToAgent yes";
    };
  };
  perSystem = { pkgs, lib, self', ... }: {
    packages.git = inputs.wrapper-modules.wrappers.git.wrap {
      inherit pkgs;
      runtimePkgs = with pkgs; [
        git-secret
      ];
      settings = {
        user = {
	  email = "brett-klenklen@proton.me";
	  name = "blu-robo";
	};
	url."git@github.com:" = {
	  insteadOf = "https://github.com";
	};
	credential.helper = "store";
      };
    };
  };
}
