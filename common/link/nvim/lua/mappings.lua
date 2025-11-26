-- ====================================
-- NEOVIM MAPPINGS CENTRALIZADOS
-- ====================================

-- ========================================
-- MAPPINGS GERAIS
-- ========================================

-- Melhor CTRL+C e CTRL+V para fora do vim
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

-- Salvar
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })

-- Makefile setup mappings
vim.keymap.set('n', '<F7>', ':!make test<CR>', { desc = 'Run make test' })
vim.keymap.set('n', '<F6>', ':w<CR>:!clear<CR>:!make compile<CR>', { desc = 'Save and compile' })
vim.keymap.set('n', '<F5>', ':!make run<CR>', { desc = 'Run make' })

-- AsyncTask mappings
-- vim.keymap.set('n', '<leader>rr', ':w<CR>:AsyncTask project-run<CR>', { desc = 'Run project' })
-- vim.keymap.set('n', '<leader>rb', ':w<CR>:AsyncTask project-build<CR>', { desc = 'Build project' })
-- vim.keymap.set('n', '<leader>rt', ':w<CR>:AsyncTask project-test<CR>', { desc = 'Test project' })
-- vim.keymap.set('n', '<leader>rm', ':w<CR>:AsyncTask project-monitor<CR>', { desc = 'Monitor project' })

-- Executar arquivo com python
vim.keymap.set('n', '<leader><F5>p', ':!rifle -w python %<CR>', { desc = 'Run with python' })

-- ========================================
-- TERMINAL MAPPINGS
-- ========================================

-- Abrir Terminal ah lá VSCode
vim.keymap.set('n', '<leader>h', ':ToggleTerm direction=horizontal<CR>', { desc = 'Toggle terminal horizontal' })
vim.keymap.set('n', '<leader>a', ':ToggleTerm<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('n', '<leader>T', ':ToggleTerm direction=float<CR>', { desc = 'Toggle terminal float' })

-- Terminal ESC goes to normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ========================================
-- TEXT MODE MAPPINGS
-- ========================================

-- Switches do modo Escrita
vim.keymap.set('n', '<Leader>ton', ':Texton<CR>', { desc = 'Text mode on' })
vim.keymap.set('n', '<Leader>tof', ':Textoff<CR>', { desc = 'Text mode off' })

-- ========================================
-- FILE MAPPINGS
-- ========================================

-- Atalhos de arquivos
vim.keymap.set('n', '<F12>', ':vsp ~/.config/nvim/vimrc.vim<CR>', { desc = 'Open vimrc' })
vim.keymap.set('n', '<F1>', ':vsp makefile<CR>', { desc = 'Open makefile' })

-- ========================================
-- EDITING MAPPINGS
-- ========================================

-- Control-Backspace
vim.keymap.set('n', '<C-BS>', 'vbd', { desc = 'Delete word backward' })
vim.keymap.set('i', '<C-BS>', '<ESC>vbda', { desc = 'Delete word backward in insert' })

-- Insert Mode Movements
vim.keymap.set('i', '<c-h>', '<ESC>i', { desc = 'Move left in insert' })
vim.keymap.set('i', '<c-j>', '<ESC>ja', { desc = 'Move down in insert' })
vim.keymap.set('i', '<c-k>', '<ESC>lki', { desc = 'Move up in insert' })
vim.keymap.set('i', '<c-l>', '<ESC>la', { desc = 'Move right in insert' })

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Yazi
vim.keymap.set('n', '<Leader>gy', ':Yazi<CR>', { desc = 'Open Yazi' })

-- Remap commentary
vim.keymap.set('n', '<Leader>c', 'gcc', { desc = 'Comment line', remap = true })
vim.keymap.set('v', '<Leader>c', 'gc', { desc = 'Comment selection', remap = true })

-- End comma
vim.keymap.set('i', ';;', '<ESC>A;<ESC>', { desc = 'Add semicolon at end' })

-- Normal mode on jj
vim.keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode' })

-- Copy/Paste system clipboard
vim.keymap.set('n', '<c-c>', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<c-v>', '"+p', { desc = 'Paste from clipboard' })

-- Limpar conteudo do search, para retirar o highlight
vim.keymap.set('n', '<Leader>/', ':noh<CR>', { desc = 'Clear search highlight' })

-- Center search results
vim.keymap.set('n', 'n', 'nzz', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Previous search result (centered)' })

-- ========================================
-- SURROUND MAPPINGS
-- ========================================

-- Surround visual selections
vim.keymap.set('v', "'", "c'<c-r>\"'<esc>", { desc = "Surround with single quotes" })
vim.keymap.set('v', '"', 'c"<c-r>""<esc>', { desc = "Surround with double quotes" })
vim.keymap.set('v', '(', 'c(<c-r>")<esc>', { desc = "Surround with parentheses" })
vim.keymap.set('v', '[', 'c[<c-r>"]<esc>', { desc = "Surround with brackets" })
vim.keymap.set('v', '{', 'c{<c-r>"}<esc>', { desc = "Surround with braces" })

-- ========================================
-- UTILITY MAPPINGS
-- ========================================

-- Portuguese keyboard layout convenience
vim.keymap.set({'n', 'v'}, 'ç', ';', { desc = 'Ç as semicolon' })
vim.keymap.set({'n', 'v'}, 'Ç', ':', { desc = 'Ç as colon' })

-- Dragon drop file
vim.keymap.set('n', '<Leader>df', ':!dragon-drop %<CR>', { desc = 'Dragon drop current file' })

-- Beautifier
vim.keymap.set('n', '<F9>', ':Neoformat<CR>', { desc = 'Format code' })

-- Claude Code
vim.keymap.set('n', '<Leader>i', ':ClaudeCode<CR>', { desc = 'Open Claude Code' })

-- ========================================
-- TELESCOPE MAPPINGS
-- ========================================

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- ========================================
-- NVIM-TREE MAPPINGS
-- ========================================

vim.keymap.set('n', '<leader>w', ':NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })

-- ========================================
-- SCREENSHOT MAPPINGS
-- ========================================

vim.keymap.set('v', '<Leader>s', ':<C-U>TakeScreenshotVisual<CR>', { desc = 'Take screenshot of selection' })

-- ========================================
-- BUFFERLINE MAPPINGS
-- ========================================

-- Função para alternar para buffers específicos
local function goto_buffer(num)
  vim.cmd("BufferLineGoToBuffer " .. num)
end

-- Mapear Alt+1, Alt+2, ..., Alt+9
for i = 1, 9 do
  vim.keymap.set("n", "<M-" .. i .. ">", function() goto_buffer(i) end, { desc = "Go to buffer " .. i })
end

-- ========================================
-- SNIPPETS MAPPINGS
-- ========================================

-- Choice navigation for LuaSnip
local ls = require("luasnip")
vim.keymap.set({"i", "s"}, "<c-n>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { desc = 'Next choice in snippet' })

-- ========================================
-- NVIM-TREE SPECIFIC MAPPINGS
-- ========================================

-- Swap then open tab (dentro do nvim-tree)
local swap_then_open_tab = function()
  local api = require("nvim-tree.api")
  local node = api.tree.get_node_under_cursor()
  vim.cmd("wincmd h")
  api.node.open.tab(node)
end

vim.keymap.set("n", "t", swap_then_open_tab, { desc = 'Open in new tab (nvim-tree)' })


-- ========================================
-- NEOTEST MAPPINGS
-- ========================================

local neotest = require("neotest")
vim.keymap.set('n', '<leader>op', neotest.run.run, { desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>oo', neotest.summary.toggle, { desc = 'Toggle Test Tree' })
