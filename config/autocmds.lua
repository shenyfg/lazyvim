-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "TextChanged", "TextChangedI" }, {
  pattern = "*.*",
  callback = function()
    vim.cmd("silent write")
  end,
})

autocmd({ "BufRead" }, {
  pattern = "*.md",
  callback = function()
    vim.opt_local.spell = true
  end,
})

autocmd({ "BufRead" }, {
  pattern = "*.json",
  callback = function()
    vim.opt_local.numberwidth = 2
  end,
})

-- Make commands
autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.makeprg = "time python3 %"
  end,
})

-- Disable auto fill in comment in the next line
autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
