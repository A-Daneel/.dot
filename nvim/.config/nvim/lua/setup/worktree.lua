local worktree = require("git-worktree")
worktree.setup({})

local function is_kiwi(path)
    local found = path:find("kiwi")
    return type (found) == "number" and found > 0
end

worktree.on_tree_change(function(op, metadata)
    local path = metadata["path"]
    if op == worktree.Operations.Switch then
        if is_kiwi(path) then
            local command = string.format(":silent !~/.local/bin/tmux-kiwi tmux %s", path)
            vim.cmd(command)
        end
    end
end)

vim.keymap.set(
    'n',
    '<leader>gw',
    require('telescope').extensions.git_worktree.git_worktrees
)

vim.keymap.set(
    'n',
    '<leader>gm',
    require('telescope').extensions.git_worktree.create_git_worktree)
