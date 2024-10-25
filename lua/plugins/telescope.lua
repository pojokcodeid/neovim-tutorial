return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	opts = function()
		local icons = require("user.icons")
		local actions = require("telescope.actions")
		vim.g.theme_switcher_loaded = true
		return {
			defaults = {
				prompt_prefix = icons.ui.Telescope .. " ",
				selection_caret = icons.ui.Forward .. " ",
				entry_prefix = "   ",
				initial_mode = "insert",
				selection_strategy = "reset",
				path_display = { "smart" },
				color_devicons = true,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<esc>"] = actions.close,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["q"] = actions.close,
					},
				},
			},
			extensions_list = { "themes", "terms" },
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					only_sort_text = true,
					additional_args = function()
						return { "--multiline" }
					end,
				},
				grep_string = {
					only_sort_text = true,
				},
				buffers = {
					initial_mode = "normal",
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
				},
				planets = {
					show_pluto = true,
					show_moon = true,
				},
				git_files = {
					hidden = true,
					show_untracked = true,
				},
				colorscheme = {
					enable_preview = true,
				},
			},
			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		}
	end,
	config = function(_, opts)
		require("telescope").setup(opts)
		-- load extensions_list
		pcall(function()
			for _, ext in ipairs(opts.extensions_list) do
				require("telescope").load_extension(ext)
			end
		end)
	end,
	keys = {
		{ "<leader>s", "", desc = "  Search", mode = "n" },
		{ "<leader>f", "<cmd>Telescope find_files<CR>", desc = " Find files", mode = "n" },
		{ "<leader>F", "<cmd>Telescope live_grep<cr>", desc = " Find Text", mode = "n" },
		{ "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", mode = "n" },
		{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", mode = "n" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", mode = "n" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", mode = "n" },
		{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", mode = "n" },
		{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", mode = "n" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", mode = "n" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", mode = "n" },
	},
}
