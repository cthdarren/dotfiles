return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			config = {
                packages ={ enable = false},
                footer = {},
                shortcut = {},
                project = {limit = 3, enable = false},
                mru = {limit = 8},
				header = {"",
"⠀⠀⠀⠀⠀⠀⠀⡴⠶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡶⠶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⢨⡙⠳⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠟⠁⣀⠀⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠈⣷⠀⠀⠙⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠞⠁⠀⣄⡇⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠈⣇⢠⣀⠀⣼⠀⠀⠀⢠⠟⣷⣤⣦⠶⠞⠛⠛⠛⠛⠛⠟⠶⠶⢤⡘⣏⠲⣰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⢹⣄⣉⣙⣛⣒⣶⡾⠓⢲⡵⠋⠀⠀⠀⠀⣠⡶⠷⠄⠀⠀⠀⠀⠉⠙⢦⡹⣇⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⢀⡼⢷⣀⠀⣠⡖⠁⢀⡼⠁⠀⠀⡀⠄⠁⠀⠁⠀⠀⢀⠐⠈⢀⠐⠀⠀⣀⠘⢿⣳⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⣿⣿⣷⠻⣿⣿⣿⢀⠞⠀⠀⢀⠂⠀⠀⡀⠀⠀⠀⠀⠀⠀⠈⠀⠀⢟⣎⠀⠡⢀⡹⡗⣆⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⢸⠀⠉⡿⠁⢷⡀⡞⠀⠀⠠⠀⠂⡄⠀⠐⠀⡀⠀⠀⠈⠐⡠⠀⠀⠀⠄⢠⣧⠙⢲⡄⢧⢹⡄⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⣾⠀⢲⣿⠀⢀⡟⠀⠀⠠⠁⠀⢀⡇⠀⠠⠁⠀⡀⠈⠀⢴⠁⠀⠀⠀⡀⠀⡦⢳⡈⢧⡀⡇⣇⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⡏⢠⠞⠋⠁⠀⠀⡀⠀⠐⠀⠀⢸⡄⠀⠀⢬⠏⠀⡠⣼⡋⠀⢀⠀⠀⠄⢴⠉⠁⠂⢣⣎⠇⣾⠀⠀⠮⢐⠡⢊⡆",
"⠀⠀⠀⠀⢸⡇⢈⣷⣶⣶⣶⣿⡇⠀⠠⠈⠀⠘⡇⠀⢬⡿⠀⢠⢞⠏⠀⣰⠏⠀⠀⢤⠃⠀⠀⠀⢀⠏⠀⡿⠀⠀⠁⠁⢮⠔⠀",
"⠀⠀⠀⢀⡿⠀⢸⣟⣿⣳⢯⣿⡇⠀⠀⠀⠂⠀⣇⠴⡟⢁⠴⠫⣊⡤⢪⠋⠀⢀⡰⢋⣀⠀⠀⠀⢸⠄⢰⡇⠀⠐⢠⠥⠂⠀⠀",
"⠀⠀⠀⣸⠃⠀⢸⣧⢻⣿⣯⣟⣿⠀⠀⠈⣧⠀⠹⣈⣬⣷⣶⣶⣦⡀⠧⠤⠖⠋⠀⣴⣶⣶⡶⣄⠇⡤⣼⠁⠀⠈⠁⠀⠀⠀⠀",
"⠀⠀⢠⠏⠀⠀⣟⡼⣳⡏⢻⣾⠘⢇⠀⠀⠸⣷⢄⣹⡉⠁⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠈⠿⡞⢱⠇⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⣰⠋⠀⠀⠀⣏⠷⣹⠃⠀⠈⠧⣘⣦⠀⠀⠸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⢠⠏⠀⠀⠀⠀⢸⣏⡿⠀⠀⠀⠀⠀⠙⢷⣄⠀⠙⣶⢤⣄⣀⠀⢀⠶⡖⠉⠉⠉⠉⠳⣄⡤⠖⣫⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⣿⠀⠀⠀⠀⡀⠘⣾⠁⠀⠀⠀⠰⣿⣿⣿⣿⣿⣶⣬⡻⠋⡿⣿⢿⢸⠀⠀⠀⠐⣠⠀⢸⣧⣾⣛⣶⣹⣆⣀⣀⣀⣀⡀⠀⠀⠀",
"⢹⣧⡀⠀⠀⠘⣆⠹⡄⠀⠀⠀⠀⣿⣿⣿⠛⢻⣿⣫⣙⣦⣸⣿⣿⣿⣯⣉⠛⣲⠼⣊⠁⣽⡏⠙⠒⠒⠠⡠⠤⠤⠬⠭⠭⠽⠷",
"⠀⠙⢾⣦⢄⡀⠸⣡⠙⣄⠀⠀⠀⢸⣿⣿⡞⣿⣿⣿⣿⣿⡟⣿⣿⣿⡇⠀⠑⠂⠁⠀⣿⣿⣗⡢⠄⣀⠀⠄⠀⠀⠀⠀⠀⠀⢀",
"⠀⠀⠀⠙⠳⢾⣢⡓⡆⢹⣆⣾⢭⡉⠉⠉⠉⠉⠐⠒⠯⢅⡱⠨⣽⣿⣴⣦⣀⣀⣴⣶⠵⢼⠁⠀⠉⠒⠀⠀⠈⠉⠁⠐⠛⠳⣄",
"⠀⠀⠀⠀⠀⠀⣿⡱⣹⣬⣻⣸⠑⠪⢍⣒⠠⠤⠤⠔⣒⣒⡒⣹⡛⠛⠉⠉⠉⠉⠉⠛⠿⣗⡶⣤⣀⠀⠸⠀⠀⠀⠀⠀⠀⢠⠋",
                    "",
            }
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
