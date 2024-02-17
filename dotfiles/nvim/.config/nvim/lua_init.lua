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

vim.opt.dir = "/home/hayden/.cache/nvim"           -- Set swapfile directory
vim.opt.bdir = "/home/hayden/.cache/nvim"          -- Set backup file directory

vim.opt.history = 500                   -- Remember 500 last commands
vim.opt.scrolloff = 10                  -- Lines to pad cursor

vim.opt.undofile = true                 -- Save undo history to file
vim.opt.undodir = "/home/hayden/.cache/nvim"       -- Set undo file directory


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
    "junegunn/goyo.vim",                    -- Comfortable formatting
    "lukas-reineke/indent-blankline.nvim",  -- Indentation lines
    "mfussenegger/nvim-lint",               -- Linting support
    "mg979/vim-visual-multi",               -- Multi-cursor editing
    "nvim-tree/nvim-web-devicons",          -- Icon pack
    "stevearc/oil.nvim",                    -- File browser in buffer
    "tomasiser/vim-code-dark",              -- VS Code theme
    "tpope/vim-commentary",                 -- Selection commenting
    "tpope/vim-surround",                   -- Change parentheses/quotes/etc
    "vim-airline/vim-airline",              -- Improved status bar
    "windwp/nvim-autopairs",                -- Pair delimiters
})


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


-- Set up linting
require('lint').linters_by_ft = {
    python = { 'mypy',},
    markdown = {'vale',}
}


-- Disable new line comment
vim.api.nvim_create_autocmd('FileType', {
    pattern = { '*' },
    callback = function()
        vim.opt.formatoptions = "c"
        vim.opt.formatoptions = "r"
        vim.opt.formatoptions = "o"
    end,
    group = generalSettingsGroup,
})
