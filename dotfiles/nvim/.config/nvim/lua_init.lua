-- Basic config
vim.opt.number = true                   -- Show line number
vim.opt.cul = true                      -- Show cursor line
-- vim.opt.foldmethod = "indent"           -- Fold matching indent levels
vim.opt.lazyredraw = true               -- Wait to redraw screen
vim.cmd [[colorscheme cool]]            -- Set theme to custom

vim.opt.list = true                     -- Show tab and EOL
vim.opt.listchars:append "space:·"      -- Space char
vim.opt.listchars:append "eol:↴"        -- Eol char

vim.opt.smartindent = true              -- Use smart indentation
vim.opt.expandtab = true                -- Spaces instead of tabs
vim.opt.tabstop = 4                     -- Number of tab spaces
vim.opt.shiftwidth = 4                  -- Number of expanded tab spaces

vim.opt.ignorecase = true               -- Non case-sensitive searches
vim.opt.smartcase = true                -- Pattern is case sensitive if uppercase
vim.opt.hlsearch = true                 -- Automatically highlight

vim.opt.showcmd = true                  -- Show last command on status
vim.opt.showmode = true                 -- Show current mode on status

vim.opt.dir = "/home/" .. os.getenv("USER") .. "/.cache/nvim"           -- Set swapfile directory
vim.opt.bdir = "/home/".. os.getenv("USER") .."/.cache/nvim"          -- Set backup file directory

vim.opt.history = 500                   -- Remember 500 last commands
vim.opt.scrolloff = 10                  -- Lines to pad cursor

vim.opt.undofile = true                 -- Save undo history to file
vim.opt.undodir = "/home/".. os.getenv("USER") .."/.cache/nvim"       -- Set undo file directory

vim.opt.formatoptions = "c"
vim.opt.formatoptions = "r"
vim.opt.formatoptions = "o"

-- Goyo
vim.g["goyo_width"] = 115                           -- Width of goyo window


-- Matchparen
vim.g['matchparen_timeout'] = 10
vim.g['matchparen_insert_timeout'] = 10


-- Vim airline
vim.g['airline#extensions#tabline#enabled '] = 1    -- Enable fancy tabline
vim.g['airline_powerline_fonts'] = 1                -- Use powerline fonts
vim.g['airline_theme'] = "codedark"                 -- Use VSCode dark theme


-- SuperTab
vim.g['SuperTabDefaultCompletionType'] = "context"  -- SuperTab completion type


-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- Config and use lazy
require("lazy").setup({
    "ervandew/supertab",                    -- Tab complete
    -- "VonHeikemen/lsp-zero.nvim",
    -- "neovim/nvim-lspconfig",
    -- "hrsh7th/cmp-nvim-lsp",
    -- "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-path",
    -- -- "hrsh7th/cmp-cmdline",
    -- "hrsh7th/nvim-cmp",
    -- "L3MON4D3/LuaSnip",
    -- "williamboman/mason.nvim",
    -- "williamboman/mason-lspconfig.nvim",

    "junegunn/goyo.vim",                    -- Comfortable formatting
    "lukas-reineke/indent-blankline.nvim",  -- Indentation lines
    "mg979/vim-visual-multi",               -- Multi-cursor editing
    "nvim-tree/nvim-web-devicons",          -- Icon pack
    "stevearc/oil.nvim",                    -- File browser in buffer
    "tomasiser/vim-code-dark",              -- VS Code theme
    "tpope/vim-commentary",                 -- Selection commenting
    "tpope/vim-surround",                   -- Change parentheses/quotes/etc
    "vim-airline/vim-airline",              -- Improved status bar
    "windwp/nvim-autopairs",                -- Pair parentheses and brackets
},

{
  "lervag/vimtex",
  init = function()
    -- Use init for configuration, don't use the more common "config".
  end
}
)


-- Set up nvim-autopairs
require("nvim-autopairs").setup {}


-- Setup nvim oil
require("oil").setup()


-- Indent lines
require("ibl").setup({
    scope = {
        enabled = false
    }
})


-- Disable new line comments
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')


-- -- Setup LSP
-- local lsp_zero = require('lsp-zero')

-- lsp_zero.on_attach(function(client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     lsp_zero.default_keymaps({buffer = bufnr})
-- end)

-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     ensure_installed = {},
--     handlers = {
--         function(server_name)
--             require('lspconfig')[server_name].setup({})
--         end,
--     },
-- })


-- -- Setup cmp-nvim

-- -- Icon arrau
-- local kind_icons = {
--     Text = "",
--     Method = "󰆧",
--     Function = "󰊕",
--     Constructor = "",
--     Field = "󰇽",
--     Variable = "󰂡",
--     Class = "󰠱",
--     Interface = "",
--     Module = "",
--     Property = "󰜢",
--     Unit = "",
--     Value = "󰎠",
--     Enum = "",
--     Keyword = "󰌋",
--     Snippet = "",
--     Color = "󰏘",
--     File = "󰈙",
--     Reference = "",
--     Folder = "󰉋",
--     EnumMember = "",
--     Constant = "󰏿",
--     Struct = "",
--     Event = "",
--     Operator = "󰆕",
--     TypeParam = "󰅲",
-- }


-- local cmp = require('cmp')
-- local cmp_format = require('lsp-zero').cmp_format({details = true})

-- cmp.setup({
--     sources = {
--         {name = 'nvim_lsp'},
--         {name = 'buffer'},
--         {name = 'path'},
--     },

--     mapping = cmp.mapping.preset.insert({
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.abort(),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     }),

--     formatting = {
--         format = function(entry, vim_item)
--             -- Kind icons
--             vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
--             -- Source
--             vim_item.menu = ({
--                 buffer = "[Buffer]",
--                 nvim_lsp = "[LSP]",
--                 luasnip = "[LuaSnip]",
--                 nvim_lua = "[Lua]",
--                 latex_symbols = "[LaTeX]",
--             })[entry.source.name]
--             return vim_item
--         end
--     },

--     --- (Optional) Show source name in completion menu
--     -- formatting = cmp_format,
-- })
