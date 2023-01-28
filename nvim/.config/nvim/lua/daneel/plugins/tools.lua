return {
  {
    "ThePrimeagen/git-worktree.nvim",
    keys = {
      {
        "<leader>gw",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "Switch worktree",
      },
      {
        "<leader>gm",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Create worktree",
      },
    },
    opts = function()
      local function is_kiwi(path)
        local found = path:find("kiwi")
        return type(found) == "number" and found > 0
      end

      local worktree = require("git-worktree")
      worktree.on_tree_change(function(op, metadata)
        local path = metadata["path"]
        if op == worktree.Operations.Switch then
          if is_kiwi(path) then
            local command =
              string.format(":silent !~/.local/bin/tmux-kiwi tmux %s", path)
            vim.cmd(command)
          end
        end
      end)
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("git_worktree")
    end,
  },
}
