local Worktree = require("git-worktree")

local function is_kiwi(path)
    local found = path:find("kiwi")
    return type (found) == "number" and found > 0
end

local M = {}
function M.execute(path, just_build)
    if is_kiwi(path) then
        local command = string.format(":silent !~/.local/bin/tmux-kiwi tmux %s", path)
        vim.cmd(command)
    end
end

Worktree.on_tree_change(function(_ --[[op]], path, _ --[[ upstream]])
    M.execute(path.path)
end)

return M
