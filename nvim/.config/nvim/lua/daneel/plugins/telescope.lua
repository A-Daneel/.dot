return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    cmd = "Telescope",
    keys = {
      {
        "<leader>pf",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<C-p>",
        function()
          require("telescope.builtin").git_files()
        end,
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").live_grep()
        end,
      },
    },
  },
}
