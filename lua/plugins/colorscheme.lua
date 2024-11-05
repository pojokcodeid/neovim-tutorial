return {
	"sharpchen/Eva-Theme.nvim",
	lazy = false,
	priority = 1000,
	build = ":EvaCompile",
	opts = function(_, opts)
		local dark = require("Eva-Theme.palette"):from_variant("dark")
		opts.override_highlight = {
			dark = {
				["WinBar"] = { bg = dark.background },
				["WinBarNC"] = { bg = dark.background },
			},
		}
	end,
	config = function(_, opts)
		require("Eva-Theme").setup(opts)
		local colorscheme = "Eva-Dark"
		vim.cmd("colorscheme " .. colorscheme)
	end,
}
