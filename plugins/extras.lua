return {
  {
    "keaising/im-select.nvim",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
    },
  },
  {
    "FabijanZulj/blame.nvim",
  },
  {
    "dhruvasagar/vim-table-mode",
    config = function()
      vim.g.table_mode_motion_up_map = ""
      vim.g.table_mode_motion_down_map = ""
    end,
  },
}
