return {
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		opts = function()
			local fb_actions = require("telescope._extensions.file_browser.actions")
			return {
				extensions = {
					file_browser = {
						-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#themes
						---@alias telescope_themes
						---| "cursor"   # see `telescope.themes.get_cursor()`
						---| "dropdown" # see `telescope.themes.get_dropdown()`
						---| "ivy"      # see `telescope.themes.get_ivy()`
						theme = "dropdown",
						-- disables netrw and use telescope-file-browser in its place
						hijack_netrw = true,
						mappings = {
							["i"] = {
								["<A-c>"] = fb_actions.create,
								["<S-CR>"] = fb_actions.create_from_prompt,
								["<A-r>"] = fb_actions.rename,
								["<A-m>"] = fb_actions.move,
								["<A-y>"] = fb_actions.copy,
								["<A-d>"] = fb_actions.remove,
								["<C-o>"] = fb_actions.open,
								["<C-g>"] = fb_actions.goto_parent_dir,
								["<C-e>"] = fb_actions.goto_home_dir,
								["<C-w>"] = fb_actions.goto_cwd,
								["<C-t>"] = fb_actions.change_cwd,
								["<C-f>"] = fb_actions.toggle_browser,
								["<C-h>"] = fb_actions.toggle_hidden,
								["<C-s>"] = fb_actions.toggle_all,
								["<bs>"] = fb_actions.backspace,
							},
							["n"] = {
								["c"] = fb_actions.create,
								["r"] = fb_actions.rename,
								["m"] = fb_actions.move,
								["y"] = fb_actions.copy,
								["d"] = fb_actions.remove,
								["o"] = fb_actions.open,
								["g"] = fb_actions.goto_parent_dir,
								["e"] = fb_actions.goto_home_dir,
								["w"] = fb_actions.goto_cwd,
								["t"] = fb_actions.change_cwd,
								["f"] = fb_actions.toggle_browser,
								["h"] = fb_actions.toggle_hidden,
								["s"] = fb_actions.toggle_all,
							},
						},
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("file_browser")
		end,
		keys = {
			{ "<leader>o", "", desc = "  Open" },
			{
				"<leader>ob",
				":Telescope file_browser<CR>",
				desc = "File Browser",
			},
			{
				"<leader>oB",
				":Telescope file_browser path=%:p:h select_buffer=true<CR>",
				desc = "File Browser current buffer",
			},
		},
	},
}
