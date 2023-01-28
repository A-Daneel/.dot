return {
  {
    "tpope/vim-fugitive",
    cmd = "G",
    keys = {
      { "<leader>gs", vim.cmd.Git },
    },
  },
  -- better diffing (of just learn fugitive diff maybe? git gud scrub
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
    config = true,
    keys = {
      { "<leader>gr", "<cmd>DiffviewOpen<cr>", desc = "DiffView" },
    },
  },
}
