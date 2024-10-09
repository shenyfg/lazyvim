-- Modify lazyvim plugins
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
      {
        "<C-;>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<C-,>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
    opts = {
      window = {
        mappings = {
          -- disable mappings
          ["/"] = "noop",
          ["w"] = "noop",
          ["oc"] = "noop",
          ["od"] = "noop",
          ["og"] = "noop",
          ["om"] = "noop",
          ["on"] = "noop",
          ["os"] = "noop",
          ["ot"] = "noop",
          ["z"] = "noop",
          ["y"] = "noop",
          ["S"] = "noop",
          ["P"] = "noop",

          ["o"] = "open",
          ["s"] = "open_split",
          ["v"] = "open_vsplit",
          ["<tab>"] = "toggle_preview",
          ["<C-,>"] = "close_window",
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<S-h>", false },
      { "<S-l>", false },

      { "<M-1>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 1<CR>" },
      { "<M-2>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 2<CR>" },
      { "<M-3>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 3<CR>" },
      { "<M-4>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 4<CR>" },
      { "<M-5>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 5<CR>" },
      { "<M-6>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 6<CR>" },
      { "<M-7>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 7<CR>" },
      { "<M-8>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 8<CR>" },
      { "<M-9>", mode = { "n", "t", "v" }, "<Cmd>BufferLineGoToBuffer 9<CR>" },
    },
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>ghr", false },
      { "<leader>ghR", false },
      { "<leader>ghp", false },

      {
        "<leader>gu",
        function()
          local gs = package.loaded.gitsigns
          gs.reset_hunk()
        end,
        desc = "Reset Hunk",
      },
      {
        "<leader>gU",
        function()
          local gs = package.loaded.gitsigns
          gs.reset_buffer()
        end,
        desc = "Reset Buffer",
      },
      {
        "<leader>gp",
        function()
          local gs = package.loaded.gitsigns
          gs.preview_hunk_inline()
        end,
        desc = "Preview Hunk Inline",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fR", false },

      { "<leader>fr", mode = { "n" }, LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>r", mode = { "n" }, "<Cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
    },
  },
}
