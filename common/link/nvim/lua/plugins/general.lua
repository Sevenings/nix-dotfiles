return {
    {'elkowar/yuck.vim'},
    {'tpope/vim-fugitive'},
    {'tikhomirov/vim-glsl'},
    {'ryanoasis/vim-devicons'},
    {'DreamMaoMao/yazi.nvim'},
    {
      "karb94/neoscroll.nvim",
      config = function ()
        require('neoscroll').setup({})
      end
    },
    { 'airblade/vim-rooter' },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
    },
    {"sbdchd/neoformat"}
}
