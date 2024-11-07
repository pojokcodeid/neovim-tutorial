return {
	"barrett-ruth/live-server.nvim",
	build = "pnpm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
	config = true,
	keys = {
		{ "<leader>rl", "<cmd>LiveServerToggle<cr>", desc = "Live Server" },
	},
}
