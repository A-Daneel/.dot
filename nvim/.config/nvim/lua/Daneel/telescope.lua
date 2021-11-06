local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer   = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer   = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.dotfiles/nvim/.config/nvim/",
        hidden = true,
    })
end

function set_background(content)
    print(content)
    vim.fn.system(
       "gsettings set org.gnome.desktop.background picture-uri file:///" .. content
    )
end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)
        local content =
            require("telescope.actions.state").get_selected_entry(prompt_bufnr)
        set_background(content.cwd .. "/" ..content.value)
        if close then
            require("telescope.actions").close(prompt_bufnr)
        end
    end

    map("i", "<C-p>", function()
        set_the_background()
    end)

    map("i", "<CR>", function()
        set_the_background(true)
    end)
end

local function image_selector(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            theme = get_dropdown,
            prompt_title = prompt,
            cwd = cwd,

            attach_mappings = function(prompt_bufnr, map)
                select_background(prompt_bufnr, map)
                return true
            end
        })
    end
end

M.background_selector = image_selector("< Backgrounds > ", "/home/daneel/Backgrounds")

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end
    })
end

return M
