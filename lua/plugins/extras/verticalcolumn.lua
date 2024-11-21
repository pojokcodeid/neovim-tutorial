return {
	"lukas-reineke/virt-column.nvim",
	event = "BufRead",
	opts = {},
	config = function()
		local icons = require("user.icons")
		require("virt-column").overwrite({
			exclude = {
				filetypes = { "help", "text", "markdown" },
			},
			char = icons.ui.LineMiddle,
		})
		-- Mengatur column color max 80 character
		vim.api.nvim_create_autocmd("BufWinEnter", {
			pattern = "*",
			callback = function()
				vim.opt.formatoptions = "croql"
				vim.opt.textwidth = 80
				vim.opt.colorcolumn = "+1"
				vim.opt.lazyredraw = false
			end,
		})
	end,
}
