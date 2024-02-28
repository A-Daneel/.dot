return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-telescope/telescope-bibtex.nvim",
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
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      local extensions = { "fzf", "bibtex" }
      for _, extension in ipairs(extensions) do
        telescope.load_extension(extension)
      end
    end,
    keys = function()
      local builtin = require("telescope.builtin")
      return {
        {
          "<leader>pf",
          function()
            builtin.find_files()
          end,
        },
        {
          "<C-p>",
          function()
            builtin.git_files()
          end,
        },
        {
          "<leader>ps",
          function()
            builtin.live_grep()
          end,
        },
      }
    end,
  },
}
