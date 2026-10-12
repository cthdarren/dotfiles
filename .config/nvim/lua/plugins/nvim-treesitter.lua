return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false, -- this plugin does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"lua",
				"javascript",
				"python",
				"html",
				"json",
				"typescript",
				"yaml",
				"css",
				"scss",
			})
		end,
	},
}
