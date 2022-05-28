-- Misc maps
vim.keymap.set("n", "<leader>pv", ":Explore<CR>", { noremap = true })

-- Void paste remap
vim.keymap.set("v", "<leader>p", '"_dP', { noremap = true })

-- Void delete remap
vim.keymap.set("v", "<leader>d", '"_x', { noremap = true })

-- Copy to system clipboard maps
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", 'gg"+yG', { noremap = true })

-- Visual mode move line maps
vim.cmd([[
    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv
]])
