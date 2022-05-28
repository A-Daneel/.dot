-- how to do this in lua, mebby with colorbuddy?
vim.cmd("colorscheme gruvbox")

vim.cmd([[
	highlight ColorColumn ctermbg=0 guibg=grey
	hi SignColumn guibg=none
	hi CursorLineNR guibg=None
	highlight Normal guibg=none
	highlight LineNr guifg=#5eacd3
	highlight netrwDir guifg=#5eacd3
	highlight qfFileName guifg=#aed75f
	hi TelescopeBorder guifg=#5eacd
]])
