---@module "lazy"
---@type LazySpec[]
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-phpunit",
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("neotest").setup({
        icons = {
          passed = "🗸",
          running = "→",
          failed = "X",
          unknown = "?",
        },
        status = {
          enabled = true,
          signs = true,
          virtual_text = true,
        },
        adapters = {
          require("neotest-phpunit")({
            phpunit_cmd = function()
              return "bin/phpunit"
            end,
            filter_dirs = { "vendor" },
          }),
        },
      })
    end,
    keys = function()
      return {
        {
          "<leader>tn",
          "<cmd>lua require('neotest').run.run()<CR>",
          desc = "Test Nearest",
        },
        {
          "<leader>tf",
          "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
          desc = "Test File",
        },
        {
          "<leader>ts",
          "<cmd>lua require('neotest').summary.toggle()<CR>",
          desc = "Test Suite",
        },
      }
    end,
  },
  --{
  --  "andythigpen/nvim-coverage",
  --  dependencies = "nvim-lua/plenary.nvim",
  --  -- dislike this config, but it's the only way to get toggle working reliable
  --  config = function()
  --    local cov = require("coverage")
  --    cov.setup({
  --      auto_reload = true,
  --    })
  --    cov.load(true)
  --    cov.toggle()
  --  end,
  --  keys = {
  --    {
  --      "<leader>cos",
  --      function()
  --        local cov = require("coverage")
  --        cov.load(true)
  --        cov.summary()
  --      end,
  --      desc = "Coverage Summary",
  --    },
  --    {
  --      "<leader>cov",
  --      function()
  --        local cov = require("coverage")
  --        cov.toggle()
  --      end,
  --      desc = "Show Coverage",
  --    },
  --  },
  --},
}
