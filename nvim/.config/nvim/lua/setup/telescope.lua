local telescope = require("telescope")

telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--hidden",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		mappings = {
            i = {
                ["<C-h>"] = require'telescope'.extensions.send_to_harpoon.actions.send_selected_to_harpoon
            },
			n = {
				["<C-q>"] = require("telescope.actions").smart_send_to_qflist,
				["<C-s>"] = require("telescope.actions").toggle_selection,
			},
		},

        propt_prefix = " >",
		color_devicons = true,
		layout_config = {
			prompt_position = "bottom",
		},
	},

	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

telescope.load_extension("fzy_native")
telescope.load_extension("git_worktree")
telescope.load_extension("refactoring")

vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>ps', require('telescope.builtin').grep_string)
