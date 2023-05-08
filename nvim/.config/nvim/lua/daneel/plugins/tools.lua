return {
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>u",
        "<cmd>UndotreeToggle<CR>",
        desc = "Toggle undotree",
      },
    },
  },
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>ts", "<cmd>TestSuite<CR>", desc = "Test Suite" },
      { "<leader>tn", "<cmd>TestNearest<CR>", desc = "Test Nearest" },
      { "<leader>tf", "<cmd>TestFile<CR>", desc = "Test File" },
      { "<leader>tl", "<cmd>TestLast<CR>", desc = "Test Last" },
    },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#start_normal"] = "1"
      vim.g["test#neovim#term_position"] = "below 15"
    end,
  },
  -- testing better diagnostics list and others
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      icons = false,
      use_diagnostic_signs = true,
    },
    keys = {
      {
        "<leader>xx",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        desc = "Document Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        desc = "Workspace Diagnostics (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>TroubleToggle loclist<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>TroubleToggle quickfix<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            vim.cmd.cprev()
          end
        end,
        desc = "Previous trouble/quickfix item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            vim.cmd.cnext()
          end
        end,
        desc = "Next trouble/quickfix item",
      },
    },
  },
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
