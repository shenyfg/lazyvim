-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Disable default lazyvim options
opt.undofile = false
opt.undolevels = 1000
opt.cursorline = false
opt.list = false
opt.completeopt = "menu,preview"
-- opt.relativenumber = false

opt.statuscolumn = ""
-- opt.signcolumn = "auto"

opt.fillchars = {
  fold = "·",
  foldopen = "-",
  foldclose = "+",
  foldsep = "|",
  diff = "-",
  eob = "~",
}

-- set fold to default
opt.foldtext = "foldtext()"
opt.foldmethod = "indent"

opt.scrolloff = 10

opt.wildmode = { "longest", "list" }

opt.fileencodings = { "utf-8", "gb18030" }

vim.env.WORK_DIR = vim.fn.expand("%:p:h")
