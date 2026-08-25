{ self, inputs, ... }: {
  flake.nixosModules.nvim = { pkgs, lib, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];
    programs.nvf = {
      enable = true;
      settings = {
      };
    };
  };
}
