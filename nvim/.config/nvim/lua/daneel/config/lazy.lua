local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

---@type LazyConfig
local lazyOpts = {
  defaults = { lazy = true },
  install = {
    missing = true,
    colorscheme = { "tokyonight" },
  },
  spec = "daneel.plugins",
}

require("lazy").setup(lazyOpts)
vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")

return {}
