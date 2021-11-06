local Worktree = require("git-worktree")
local path = require("plenary.path").path

local git_branch = ""
local status_line = ""

local last_name = nil
local last_name_results = nil

local function constrain_string(line, max_len, cut_on_end)
    if #line <= max_len then
        return line
    end

    if cut_on_end then
        return line:sub(max_len - 3) .. "..."
    end
    return "..." .. line:sub(max_len - 3)
end

local function split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end

    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

local function get_file_name()
    local name = vim.fn.bufname("%")

    if not name or name == "" then
        return "(no name)"
    end

    local name_parts = split(name, path.sep)
    local name_results = {}
    for idx = 1, #name_parts - 1 do
        table.insert(name_results, name_parts[idx]:sub(1, 1))
        table.insert(name_results, path.sep)
    end
    table.insert(name_results, name_parts[#name_parts])
    last_name_results = table.concat(name_results)
    return last_name_results
end

local function get_git_info(force)
    if force or not git_branch or git_branch == "" then
        git_branch = vim.fn["fugitive#head"]()
        if not git_branch or git_branch == "" then
            git_branch = '(no git)'
        end
        git_branch = constrain_string(git_branch, 35)
    end
    return git_branch
end

local function lsp_info()
    local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
    local errors = vim.lsp.diagnostic.get_count(0, "Error")
    local hints = vim.lsp.diagnostic.get_count(0, "Hint")

    return string.format("LSP: H %d W %d E %d", hints, warnings, errors)
end

Worktree.on_tree_change(function(op)
    if op == Worktree.Operations.Switch then
        get_git_info(true)
    end
end)

local statusline = "%%-25(%s%%)|%%-35(%s%%)%%-20(%s%%)"
function StatusLine()
    return string.format(statusline,
        constrain_string(get_file_name(), 25, false),
        get_git_info(),
        lsp_info(),
        status_line)
end

vim.o.statusline = '%!v:lua.StatusLine()'

local M = {}

M.set_status = function(line)
    status_line = line
end

return M
