---@module "lazy"
---@type LazySpec[]
return {
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    opts = { theme = "light" },
    keys = {
      {
        "<leader>sm",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
  },
  -- latex preview
  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_latexmk_engines = { _ = "-xelatex" }
      vim.g.vimtex_compiler_latexmk = {
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      vim.g.vimtex_quickfix_ignore_filters = {
        [[Overfull \\hbox]],
        [[Underfull \\hbox]],
      }
    end,
  },
}
