return{
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = { "<leader>", '"', "'", "`", "c", "v" },
  opts=function ()
    return{
      plugins={
        marks=true,
        registers=true,
        spelling={
          enabled=true,
          suggestions=20
        },
        presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = false,
					nav = false,
					z = false,
					g = false,
				},
      },
      icons={
        mappings = false,
      },
      win={
        row = -1,
				border = "rounded", -- none, single, double, shadow
				padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
				title = true,
				title_pos = "center",
				zindex = 1000,
				bo = {},
				wo = {},
      },
      layout={
        height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
      },
      show_help = true, -- show help message on the command line when the popup is visible
			show_keys = true, -- show the currently pressed key and its label as a message in the command line
			-- Disabled by default for Telescope
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt" },
			},
			---@type false | "classic" | "modern" | "helix"
			preset = "classic",
    }
  end,
  config=function (_,opts)
    local which_key = require("which-key")
		which_key.setup(opts)
		which_key.add({
		  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "󱪿 No Highlight", mode = "n" },
			{ "<leader>z", "", desc = " 󱑠 Plugins(Lazy)", mode = "n" },
			{ "<leader>zi", "<cmd>Lazy install<cr>", desc = "Install", mode = "n" },
			{ "<leader>zs", "<cmd>Lazy sync<cr>", desc = "Sync", mode = "n" },
			{ "<leader>zS", "<cmd>Lazy clear<cr>", desc = "Status", mode = "n" },
			{ "<leader>zc", "<cmd>Lazy clean<cr>", desc = "Clean", mode = "n" },
			{ "<leader>zu", "<cmd>Lazy update<cr>", desc = "Update", mode = "n" },
			{ "<leader>zp", "<cmd>Lazy profile<cr>", desc = "Profile", mode = "n" },
			{ "<leader>zl", "<cmd>Lazy log<cr>", desc = "Log", mode = "n" },
			{ "<leader>zd", "<cmd>Lazy debug<cr>", desc = "Debug", mode = "n" },
			{ "<leader>w", "<cmd>w!<CR>", desc = "󰆓 Save", mode = "n" },
			{ "<leader>q", "<cmd>q!<CR>", desc = "󰿅 Quit", mode = "n" },
		})
  end
}
