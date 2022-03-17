require("daneel.telescope")
require("daneel.lsp")
require("daneel.git-worktree")

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
