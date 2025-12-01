return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require('bufferline').setup {
        options = {
          mode = "tabs", -- set to "tabs" to only show tabpages instead
          numbers = "none", -- Pode ser "ordinal", "buffer_id", etc.
          close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
          indicator = {
            style = 'underline',
          },
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true
            }
          },
          separator_style = "slant",
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false, -- only applies to coc
          diagnostics_update_on_event = true, -- use nvim's diagnostic handler
          color_icons = true, -- whether or not to add the filetype icon highlights
          hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
          },
          highlight = {underline = true, sp = "blue"}, -- Optional
          pick = {
            alphabet = "1234567890",
          },
        }
      }

      -- Mappings movidos para mappings.lua
    end
  },
}


