return {
	"akinsho/toggleterm.nvim",
	lazy = true,
	cmd = {
		"ToggleTerm",
		"TermExec",
		"ToggleTermToggleAll",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualLines",
		"ToggleTermSendVisualSelection",
	},
	branch = "main",
	opts = {
		size = 20,
		open_mapping = [[<c-\>]],
		hide_numbers = true,
		shade_filetypes = {},
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end
		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
	keys = {
		{ "<leader>t", "", desc = "  Terminal", mode = "n" },
		{ "<leader>tx", "<cmd>ToggleTermToggleAll!<cr>", desc = "Close Tab", mode = "n" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", mode = "n" },
		{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", mode = "n" },
		{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", mode = "n" },
		{ "<leader>ts", "<cmd>ToggleTerm direction=tab<cr>", desc = "New Tab", mode = "n" },
	},
}
