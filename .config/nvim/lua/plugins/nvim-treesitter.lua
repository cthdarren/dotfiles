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

			-- main branch no longer auto-enables highlighting/indent; start them per buffer
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					if pcall(vim.treesitter.start, args.buf) then
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
	},
}
