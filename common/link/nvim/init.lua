-- Lazy Vim Setup
require('config.lazy')

-- Import vimrc
local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)


--- Plugins Config Import
---------------------


require('extras.screenshots')
require('extras.nvim-cmp-configs')

-- Configurações específicas para arquivos
require('config.file_specifics')

-- Mappings centralizados
require('mappings')


