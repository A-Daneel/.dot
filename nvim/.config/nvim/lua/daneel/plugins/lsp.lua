return {
  {
    -- special ltex shizzle
    { "barreiroleo/ltex_extra.nvim", ft = "tex" }, -- why does this not work?
    -- LSP
    {
      "neovim/nvim-lspconfig",
      cmd = "LspInfo",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        -- special nvim lsp from folke
        { "folke/neodev.nvim", opts = {} },
      },
      config = function()
        -- This is where all the LSP shenanigans will live
        local lspconfig = require("lspconfig")
        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = {
            "gopls",
            "intelephense",
            "ltex",
            "pyright",
            "rust_analyzer",
          },
        })
        require("mason-lspconfig").setup_handlers({
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = lsp_capabilities,
            })
          end,
        })
        lspconfig.ltex.setup({
          capabilities = lsp_capabilities,
          on_attach = function()
            require("ltex_extra").setup({
              load_langs = { "nl", "en-US" },
              init_check = true,
              path = vim.fn.expand("~") .. "/.dotfiles/nvim/spell",
            })
          end,
          settings = {
            ltex = {
              checkFrequency = "save",
            },
          },
        })

        vim.diagnostic.config({
          float = {
            source = "always",
          },
        })
        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(ev)
            local opts = { buffer = ev.bufnr, remap = false }

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>vri", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>vh", vim.lsp.buf.signature_help, opts)
          end,
        })
      end,
    },

    -- Autocompletion
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "micangl/cmp-vimtex",
        "L3MON4D3/LuaSnip",
      },
      opts = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        return {
          snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          },
          mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<tab>"] = nil,
            ["<S-tab>"] = nil,
          },
          sources = cmp.config.sources({
            { name = "vim-dadbod-completion" },
            { name = "nvim_lsp" },
            { name = "vimtex" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
          }),
        }
      end,
    },
  },
  --  Formatting
  {
    "stevearc/conform.nvim",
    event = "InsertEnter",
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
    opts = {
      formatters = {
        bibtex = {
          command = "bibtex-tidy",
          args = {
            "--curly",
            "--numeric",
            "--sort=year",
            "--duplicates=key,doi",
            "--strip-enclosing-braces",
            "--sort-fields",
            "--encode-urls",
          },
        },
      },
      formatters_by_ft = {
        bib = { "bibtex" },
        go = { "gofmt" },
        lua = { "stylua" },
        php = { "php_cs_fixer" },
        python = { "black" },
        rust = { "rustfmt" },
        tex = { "latexindent" },
        --["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
  -- Linter
  {
    "mfussenegger/nvim-lint",
    event = "InsertEnter",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        php = { "phpstan" },
      }
      vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
