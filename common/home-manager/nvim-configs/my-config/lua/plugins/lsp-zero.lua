return {

    -- Mason, LSP Manager
    {
        'williamboman/mason.nvim',
        version = "1.11.0",
        init = function()
            require('mason').setup({})
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        version = "1.32.0",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { -- My language servers list
                    'clangd',
                    'lua_ls',
                    'arduino_language_server',
                    'pyright',
                    'eslint',
                    'ts_ls',
                    'cssls',
                    'html',
                    'nil_ls',
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })
        end,
    },


    -- Lsp do Neovim
    {'neovim/nvim-lspconfig'},

    -- Lsp-zero, LSP pré-configurado
    {
        'VonHeikemen/lsp-zero.nvim',
        init = function()
            local lsp_zero = require('lsp-zero')

            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            -- Configure o servidor tsserver
            lsp_zero.configure('ts_ls', {
              on_attach = function(client, bufnr)
                local ts_utils = require('nvim-lsp-ts-utils')
                ts_utils.setup({})
                ts_utils.setup_client(client)
              end
            })


            -- Configure o servidor eslint
            lsp_zero.configure('eslint', {
              settings = {
                format = { enable = true }
              },
              on_attach = function(client, bufnr)
                client.resolved_capabilities.document_formatting = true
              end
            })

            -- Configure o servidor cssls
            lsp_zero.configure('cssls', {
              settings = {
                css = {
                  validate = true,
                },
                less = {
                  validate = true,
                },
                scss = {
                  validate = true,
                }
              }
            })

            MY_FQBN = "arduino:avr:uno"

            lsp_zero.configure('arduino_language_server', {
              cmd = {
                "arduino-language-server",
                "-cli-config", "/home/okabe/.arduinoIDE/arduino-cli.yaml",
                "-fqbn",
                MY_FQBN
              }
            })

            lsp_zero.setup()
        end
    },


    -- Nvim-cmp. Autosugestion e completion
     { -- optional cmp completion source for require statements and module annotations
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
}
