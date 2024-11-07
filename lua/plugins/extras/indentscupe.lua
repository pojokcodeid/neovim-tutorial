local icons = require("user.icons")
return {
	"echasnovski/mini.indentscope",
	version = false,
	event = "BufReadPre",
	opts = {
		symbol = icons.ui.LineMiddle,
		options = { try_as_border = true },
	},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"alpha",
				"dashboard",
				"fzf",
				"help",
				"lazy",
				"lazyterm",
				"mason",
				"neo-tree",
				"NvimTree",
				"notify",
				"toggleterm",
				"Trouble",
				"trouble",
			},
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})
	end,
}
