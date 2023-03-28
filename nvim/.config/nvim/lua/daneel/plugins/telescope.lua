return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-bibtex.nvim",
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      local extensions = { "fzf", "bibtex" }
      for _, extension in ipairs(extensions) do
        telescope.load_extension(extension)
      end
    end,
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
    opts = function()
      local home = vim.fn.expand("~")
      return {
        extensions = {
          bibtex = {
            format = "plain",
            global_files = { home .. "/biblio.bib" },
          },
        },
      }
    end,
  },
}
