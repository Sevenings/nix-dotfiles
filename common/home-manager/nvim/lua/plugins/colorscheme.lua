return {
  -- the colorscheme should be available when starting Neovim
  {
    "loctvl842/monokai-pro.nvim",
    version = false,
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- require('everforest').setup({
      --   background = "hard"
      -- })
      -- load the colorscheme here
      vim.cmd([[colorscheme monokai-pro]])
    end,
  }
}
