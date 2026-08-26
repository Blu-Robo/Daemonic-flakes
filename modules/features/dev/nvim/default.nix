{ self, inputs, ... }: {
  flake.nixosModules.nvim = { pkgs, lib, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];

    programs.nvf = {
      enable = true;
      settings.vim = {
        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        filetree.neo-tree = {
          enable = true;
          setupOpts = {
            enable_cursor_hijack = true;
            enable_git_status = true;
            filesystem.filtered_items.visible = true;
          };
        };
        
        statusline.lualine = {
          enable = true;
          icons.enable = true;
        };
        
        treesitter = {
          enable = true;
        };
        
        languages = {
          nix.enable = true;
          clang.enable = true;
        };
        
        telescope.enable = true;
      };
    };
  };
}
