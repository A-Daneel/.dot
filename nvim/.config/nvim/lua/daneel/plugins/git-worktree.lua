---@module "lazy"
---@type LazySpec[]
return {
  "polarmutex/git-worktree.nvim",
  version = "^2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("git_worktree")
  end,
  keys = function()
    local gw = require("telescope").extensions.git_worktree
    return {
      {
        "<leader>gwc",
        gw.create_git_worktree,
        desc = "Git worktree create",
      },
      {
        "<leader>gws",
        gw.git_worktree,
        desc = "Git worktree switch",
      },
    }
  end,
}
