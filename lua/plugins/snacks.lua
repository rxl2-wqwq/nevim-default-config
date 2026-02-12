return {
	"snacks.nvim",
	opts = {
		-- Core features
		picker = { enabled = false },
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = false },
		toggle = { map = LazyVim.safe_keymap_set },
		words = { enabled = true },

		-- Terminal dengan navigasi window
		terminal = {
			win = {
				keys = {
					nav_h = {
						"<C-h>",
						function()
							return vim.fn.winnr("h") ~= vim.fn.winnr() and "<cmd>wincmd h<cr>" or "<C-h>"
						end,
						desc = "Go to Left Window",
						expr = true,
						mode = "t",
					},
					nav_j = {
						"<C-j>",
						function()
							return vim.fn.winnr("j") ~= vim.fn.winnr() and "<cmd>wincmd j<cr>" or "<C-j>"
						end,
						desc = "Go to Lower Window",
						expr = true,
						mode = "t",
					},
					nav_k = {
						"<C-k>",
						function()
							return vim.fn.winnr("k") ~= vim.fn.winnr() and "<cmd>wincmd k<cr>" or "<C-k>"
						end,
						desc = "Go to Upper Window",
						expr = true,
						mode = "t",
					},
					nav_l = {
						"<C-l>",
						function()
							return vim.fn.winnr("l") ~= vim.fn.winnr() and "<cmd>wincmd l<cr>" or "<C-l>"
						end,
						desc = "Go to Right Window",
						expr = true,
						mode = "t",
					},
				},
			},
		},

		-- Dashboard
		dashboard = {
			preset = {
				pick = function(cmd, opts)
					return LazyVim.pick(cmd, opts)()
				end,
				header = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
        ]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
					{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
	keys = {
		-- Notifications
		{
			"<leader>n",
			function()
				if Snacks.config.picker and Snacks.config.picker.enabled then
					Snacks.picker.notifications()
				else
					Snacks.notifier.show_history()
				end
			end,
			desc = "Notification History",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},

		-- Scratch buffers
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>dps",
			function()
				Snacks.profiler.scratch()
			end,
			desc = "Profiler Scratch Buffer",
		},
	},
}
