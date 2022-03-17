lua require("refactoring").setup({})

vnoremap <silent> <leader>rr :lua require("daneel.telescope").refactors()<CR>
nnoremap <silent> <leader>rr :lua require("daneel.telescope").refactors()<CR>
nnoremap <silent> <leader>df :lua require("refactoring").debug.printf({below = false})<CR>
nnoremap <silent> <leader>db :lua require("refactoring").debug.printf({below = true})<CR>
nnoremap <silent> <leader>dv :lua require('refactoring').debug.print_var({})<CR>  
nnoremap <silent> <leader>dc :lua require('refactoring').debug.cleanup({})<CR>
