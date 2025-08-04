-- REGRA: Tab com dois espaços
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "lua", "nix"},
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.expandtab = true
  end,
})

-- vim.api.nvim_create_autocmd('TextYankPost', {
--   callback = function() vim.hl.on_yank() end,
--   desc = "Briefly highlight yanked text"
-- })
