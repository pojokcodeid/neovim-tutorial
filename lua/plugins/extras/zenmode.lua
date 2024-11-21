return {
	"folke/zen-mode.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		plugins = {
			options = {
				-- hide statusline
				laststatus = 0,
			},
		},
		-- callback where you can add custom code when the Zen window opens
		on_open = function(win)
			require("notify")("Zen Mode On")
		end,
		-- callback where you can add custom code when the Zen window closes
		on_close = function()
			require("notify")("Zen Mode OFF")
		end,
	},
	keys = {
		{ "<leader>zz", ":ZenMode<cr>", desc = "Toggle Zen Mode" },
	},
}
