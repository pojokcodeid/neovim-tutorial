return {
	"pojokcodeid/auto-lualine.nvim",
	event = { "InsertEnter", "BufRead", "BufNewFile" },
	dependencies = { "nvim-lualine/lualine.nvim" },
	config = function()
		require("auto-lualine").setup({
			setColor = "Eva-Dark",
			setOption = "roundedall",
			setMode = 5,
		})
	end,
}
