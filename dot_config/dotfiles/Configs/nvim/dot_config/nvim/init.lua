-- Optional, you don't have to run setup.
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    { import = "lazyvim.plugins.extras.ui.mini-starter" },

    -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    -- import/override with your plugins
    { import = "plugins" },
  },
})
-- require("obsidian").setup()
-- This is necessary for VimTeX to load properly
-- (Most plugin managers do this automatically)
-- vim.cmd("filetype plugin indent on")
--
vim.cmd("filetype plugin on")

-- Enable syntax highlighting
-- (Most plugin managers do this automatically)
-- vim.cmd("syntax enable")

-- Viewer options (built-in method)
vim.g.vimtex_view_method = "zathura"
local lspconfig = require("lspconfig")

lspconfig.texlab.setup({
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})
