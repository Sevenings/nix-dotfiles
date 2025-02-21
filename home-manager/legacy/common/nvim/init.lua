-- Lazy Vim Setup
require('config.lazy')

-- Import vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


--- Plugins Config Import
---------------------


require('extras.screenshots')
require('extras.nvim-cmp-configs')

require("luasnip.loaders.from_vscode").lazy_load()

-- Configurações específicas para arquivos
require('config.file_specifics')


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
