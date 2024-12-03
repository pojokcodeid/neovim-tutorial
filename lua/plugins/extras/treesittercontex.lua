return {
	"nvim-treesitter/nvim-treesitter-context",
	lazy = true,
	event = { "BufRead", "VeryLazy" },
	opts = {},
	keys = {
		{ "<leader>S", "", desc = "  TS Context" },
		{ "<leader>St", "<cmd>TSContextToggle<cr>", desc = "Toggle Context" },
	},
}
