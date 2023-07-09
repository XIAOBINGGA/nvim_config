local tools = require('tools')
return {
    tools.url_replace('hrsh7th/nvim-cmp'),
    dependencies = {tools.url_replace('hrsh7th/vim-vsnip'), tools.url_replace('hrsh7th/cmp-vsnip'),
                    tools.url_replace('hrsh7th/cmp-nvim-lsp'), tools.url_replace('hrsh7th/cmp-buffer'),
                    tools.url_replace('hrsh7th/cmp-path'), tools.url_replace('hrsh7th/cmp-cmdline'), -- 常用代码段
    tools.url_replace('rafamadriz/friendly-snippets')},
    config = function()
        local status, cmp = pcall(require, "cmp")
        if not status then
            vim.notify("没有找到 cmp")
            return
        end

        cmp.setup({
            -- 指定 snippet 引擎
            snippet = {
                expand = function(args)
                    -- For `vsnip` users.
                    vim.fn["vsnip#anonymous"](args.body)

                    -- For `luasnip` users.
                    -- require('luasnip').lsp_expand(args.body)

                    -- For `ultisnips` users.
                    -- vim.fn["UltiSnips#Anon"](args.body)

                    -- For `snippy` users.
                    -- require'snippy'.expand_snippet(args.body)
                end
            },
            -- 来源
            sources = cmp.config.sources({{
                name = "nvim_lsp"
            }, -- { name = "nvim_lsp_signature_help" },
            -- For vsnip users.
            {
                name = "vsnip"
            }, {
                name = "buffer"
            } -- For luasnip users.
            -- { name = 'luasnip' },
            -- For ultisnips users.
            -- { name = 'ultisnips' },
            -- -- For snippy users.
            -- { name = 'snippy' },
            }, {{
                name = "path"
            }}),

            -- 快捷键
            -- mapping = require("keybindings").cmp(cmp)
            -- 使用lspkind-nvim显示类型图标
            --   formatting = require("lsp.ui").formatting,
        })

        -- Use buffer source for `/`.
        cmp.setup.cmdline("/", {
            sources = {{
                name = "buffer"
            }}
        })

        -- Use cmdline & path source for ':'.
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{
                name = "path"
            }}, {{
                name = "cmdline"
            }})
        })

    end
}
