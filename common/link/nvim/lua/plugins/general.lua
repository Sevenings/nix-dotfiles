return {
    {'elkowar/yuck.vim'},
    {'tpope/vim-fugitive'},
    {'tikhomirov/vim-glsl'},
    {'ryanoasis/vim-devicons'},
    {'DreamMaoMao/yazi.nvim'},
    {'skywind3000/asynctasks.vim'},
    {'skywind3000/asyncrun.vim'},
    {
      "karb94/neoscroll.nvim",
      config = function ()
        require('neoscroll').setup({})
      end
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    {"sbdchd/neoformat"},
}
