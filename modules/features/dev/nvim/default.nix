{ moduleWithSystem, ... }: {
  flake.nixosModules.nvim = moduleWithSystem ({ self', ... }: {
    programs.neovim = {
      enable = true;
    };
  });
  perSystem = { inputs', ... }: {
  };
}
