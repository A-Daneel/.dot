---@module "lazy"
---@type LazySpec[]
return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
     "tpope/vim-dadbod" ,
     "kristijanhusak/vim-dadbod-completion" ,
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_use_nvim_notify = 1
    vim.g.db_ui_win_position = "right"
    vim.g.db_ui_winwidth = 60
    vim.g.db_ui_use_nerd_fonts = 0
  end,
}
