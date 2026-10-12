return {
	"nvim-tree/nvim-tree.lua",
    lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
	config = function()
		require("nvim-tree").setup({
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			diagnostics = {
				enable = true,
			},
		})
		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<C-b>", api.tree.toggle, {})
	end,
}
