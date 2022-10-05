-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('packer').startup(function(use)
	-- appearently packer can pack itself
	use({ "wbthomason/packer.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-calc" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "onsails/lspkind-nvim" },
            { "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({ "tjdevries/express_line.nvim",
		requires = {
			{ "kyazdani42/nvim-web-devicons" },
			{ "ryanoasis/vim-devicons" },
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({ "nvim-telescope/telescope.nvim",
		requires = {
			{ "kyazdani42/nvim-web-devicons" },
			{ "ryanoasis/vim-devicons" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
            { "asbjornhaland/telescope-send-to-harpoon.nvim" },
		},
	})
	use({ "tpope/vim-fugitive" })
	use({ "ThePrimeagen/git-worktree.nvim" })
	use({ "ThePrimeagen/refactoring.nvim" })
	use({ "nvim-treesitter/playground",
		requires = {
			{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
		},
	})
	use({ "romgrk/nvim-treesitter-context" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "ThePrimeagen/harpoon",
		requires = {
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({ "mbbill/undotree" })
	use({ "sbdchd/neoformat" })
	use({ "vim-test/vim-test",
        requires = {
            { "tpope/vim-dispatch" }
        },
    })
    use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
	use({ "danymat/neogen",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({ "lewis6991/gitsigns.nvim" })
	use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })
	use({ "tjdevries/gruvbuddy.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })
    use({ "folke/tokyonight.nvim" })
    use({ "phaazon/mind.nvim",
        config = function ()
            require'mind'.setup()
        end
    })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

	if is_bootstrap then
		require('packer').sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't make sense to execute the rest of the init.lua.
if is_bootstrap then
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = "plugins.lua",
})
