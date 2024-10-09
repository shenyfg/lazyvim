return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "MeanderingProgrammer/markdown.nvim",
  },
  {
    "dhruvasagar/vim-table-mode",
  },
  {
    "keaising/im-select.nvim",
    opts = {
      default_im_select = "com.apple.keylayout.ABC",
    },
  },
}
