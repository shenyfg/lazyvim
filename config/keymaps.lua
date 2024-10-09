-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del
local opts = { noremap = true, silent = true, nowait = true }

-- Delete default lazyvim mappings
del("n", "<leader>l", { desc = "Lazy" })
del({ "n", "t" }, "<c-/>", { desc = "Terminal (Root Dir)" })
del({ "n", "v" }, "<leader>cf", { djsc = "Format" })
del("n", "<c-_>", { desc = "which_key_ignore" })
del("t", "<Esc><Esc>", { desc = "which_key_ignore" })
del("n", "<leader><tab><tab>", { desc = "New Tab" })
del({ "n", "i", "v" }, "<A-j>", { desc = "Move Down" })
del({ "n", "i", "v" }, "<A-k>", { desc = "Move Up" })
del({ "n", "x", "o" }, "n", { desc = "DO NOT CHANGE MY SEARCHING BEHAVIOUR!" })
del({ "n", "x", "o" }, "N", { desc = "DO NOT CHANGE MY SEARCHING BEHAVIOUR!" })

-- Format
map({ "n", "v" }, "<leader>lf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- Terminal
map({ "n", "i", "v" }, "<C-\\>", function()
  LazyVim.terminal()
end, { desc = "which_key_ignore" })
map({ "t" }, "<C-\\>", "<cmd>close<cr>", { desc = "which_key_ignore" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "which_key_ignore" })

map("n", "<C-'>", "<cmd>make<CR>", { desc = "Make command" })
map("n", "<leader><tab><tab>", "<cmd>tabe %<cr>", { desc = "New Tab" })

-- After yank, keep the content in registers
map("x", "p", "pgvy", opts)

-- Autocomplete in command line mode
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Map H and L to ^ and $h (skip the extra space on the end)
-- Map with normal mode, operator-pending mode and visual mode
map({ "n", "o", "x" }, "H", "^", opts)
map("n", "L", "$", opts)
map({ "o", "x" }, "L", "$h", opts)

-- Buffers
map("n", "<C-p>", "<cmd>bprevious<cr>", opts)
map("n", "<C-n>", "<cmd>bnext<cr>", opts)
map("n", "<leader>bO", "<Cmd>BufferLineCloseOthers<CR><Cmd>only<CR>", { desc = "Delete Other Buffers and Windows" })

-- Shortcuts for `Till` operations
map("n", "c ", "ct ", opts)
map("n", "c,", "ct,", opts)
map("n", "c.", "ct.", opts)
map("n", "c)", "ct)", opts)
map("n", "c}", "ct}", opts)
map("n", "c]", "ct]", opts)
map("n", "c>", "ct>", opts)
map("n", 'c"', 'ct"', opts)
map("n", "c'", "ct'", opts)
map("n", "c;", "ct;", opts)
map("n", "c:", "ct:", opts)
map("n", "c_", "ct_", opts)
map("n", "c-", "ct-", opts)

map("n", "d ", "df ", opts)
map("n", "d,", "dt,", opts)
map("n", "d.", "dt.", opts)
map("n", "d)", "dt)", opts)
map("n", "d}", "dt}", opts)
map("n", "d]", "dt]", opts)
map("n", "d>", "dt>", opts)
map("n", 'd"', 'dt"', opts)
map("n", "d'", "dt'", opts)
map("n", "d;", "dt;", opts)
map("n", "d:", "dt:", opts)
map("n", "d_", "dt_", opts)
map("n", "d-", "dt-", opts)

-- Directly correct spelling by option 1
map({ "n" }, "+", "1z=", opts)
map({ "v" }, "+", ":normal 1z=<CR>", opts)

-- Temporary mappings for markdown editing
map("n", "@,", "yt,i**<Esc>f,i**<Esc>", opts)
map("n", "@.", "yt.i**<Esc>f.i**<Esc>", opts)

map("n", "@1", "1yei**<Esc>1ea**<Esc>", opts)
map("n", "@2", "2yei**<Esc>2ea**<Esc>", opts)
map("n", "@3", "3yei**<Esc>3ea**<Esc>", opts)
map("n", "@4", "4yei**<Esc>4ea**<Esc>", opts)
map("n", "@5", "5yei**<Esc>5ea**<Esc>", opts)
map("n", "@6", "6yei**<Esc>6ea**<Esc>", opts)
map("n", "@7", "7yei**<Esc>7ea**<Esc>", opts)
map("n", "@8", "8yei**<Esc>8ea**<Esc>", opts)
map("n", "@9", "9yei**<Esc>9ea**<Esc>", opts)

function _G.c_w_o()
  local win_count = vim.fn.winnr("$")

  if win_count > 1 then
    vim.cmd("mksession! ~/.session.vim")
    vim.cmd("only")
  end
end

function _G.c_w_u()
  local win_count = vim.fn.winnr("$")
  if win_count == 1 then
    local path = vim.fn.expand("~/.session.vim")
    local file = io.open(path, "r")
    if file then
      file:close()
      vim.cmd("source " .. path)
    else
      print("session file: ~/.session.vim not exists")
    end
  end
end

map("n", "<C-w>o", ":lua c_w_o()<CR>", { silent = true, desc = "Close other windows" })
map("n", "<C-w>u", ":lua c_w_u()<CR>", { silent = true, desc = "Restore last layout" })

map("v", "lr", "<CMD>s/left/right/g<CR><Esc>", { desc = "Change lefts to rights" })
