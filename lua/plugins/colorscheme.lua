return {
	"sharpchen/Eva-Theme.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local colorscheme = "Eva-Dark"
		vim.cmd("colorscheme " .. colorscheme)
	end,
}
