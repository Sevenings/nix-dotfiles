return {
    -- Cmp compatibility
    {'saadparwaiz1/cmp_luasnip'},

    -- Snippets Engine
    {
        'L3MON4D3/LuaSnip',
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        config = function()
            vim.cmd[[
            " Use Tab to expand and jump through snippets
            imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
            smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

            " Use Shift-Tab to jump backwards through snippets
            imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
            smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
            ]]
            
            -- Keymaps movidos para mappings.lua

        end,
        init = function ()
            -- Configuration
            local ls = require("luasnip")
            ls.config.set_config({ -- Setting LuaSnip config
              enable_autosnippets = true,
              store_selection_keys = "<Tab>",
              update_events = 'TextChanged,TextChangedI'
            })

            -- Aditional Snippets
            require("luasnip.loaders.from_snipmate").lazy_load({paths = "./snippets/snipmate"})
            require("luasnip.loaders.from_lua").load({paths = "./snippets/lua"})

        end
    },

    -- Adittional Snippets
    -- { 'rafamadriz/friendly-snippets', },

}
