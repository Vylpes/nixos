{
    home.file."/home/vylpes/.config/nvim/init.lua".source = ./init.lua;
    home.file."/home/vylpes/.config/nvim/coc-settings.json".source = ./coc-settings.json;

    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        packer-nvim
      ];
    };
}
