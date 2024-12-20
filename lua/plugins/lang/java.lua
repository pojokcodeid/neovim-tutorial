local M = {}
local is_gradle = function()
	if vim.fn.findfile("pom.xml", vim.fn.getcwd()) == "pom.xml" then
		return false
	else
		return true
	end
end

M = {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.skip_config = opts.skip_config or {}
			vim.list_extend(opts.skip_config, { "jdtls" })
		end,
	},
	{
		"pojokcodeid/auto-java-project.nvim",
		event = "VeryLazy",
		config = function()
			require("auto-java-project").setup()
			vim.keymap.set("n", "<leader>Jc", ":CreateJavaClass<cr>", { desc = "Create Java Class" })
			vim.keymap.set("n", "<leader>Jm", ":CreateJavaMainClass<cr>", { desc = "Create Java Main Class" })
			vim.keymap.set("n", "<leader>Ji", ":CreateJavaInterface<cr>", { desc = "Create Java Interface" })
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"williamboman/mason.nvim",
			"pojokcodeid/auto-jdtls.nvim",
			"rcarriga/nvim-notify",
		},
		-- your opts go here
		opts = {},
		config = function(_, opts)
			require("auto-jdtls").setup(opts)
			require("auto-jdtls.utils").lsp_keymaps()
			require("auto-jdtls.utils").jdtls_keymaps()
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"andy-bell101/neotest-java",
		},
		enabled = is_gradle(),
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-java"),
				},
			})
		end,
		-- stylua: ignore
    keys = {
      { "<leader>T","",desc="  Test"},
      { "<leader>Tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>Tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>TT", function() require("neotest").run.run(vim.loop.cwd()) end, desc = "Run All Test Files" },
      { "<leader>Tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
      { "<Leader>Ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      { "<leader>To", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
      { "<Leader>TO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<Leader>TS", function() require("neotest").run.stop() end, desc = "Stop" },
    },
	},
	{
		"rockerBOO/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = function()
			local icons = require("pcode.user.icons").kind
			require("symbols-outline").setup({
				symbols = {
					File = { icon = icons.File, hl = "@text.uri" },
					Module = { icon = icons.Module, hl = "@namespace" },
					Namespace = { icon = icons.Namespace, hl = "@namespace" },
					Package = { icon = icons.Package, hl = "@namespace" },
					Class = { icon = icons.Class, hl = "@type" },
					Method = { icon = icons.Method, hl = "@method" },
					Property = { icon = icons.Property, hl = "@method" },
					Field = { icon = icons.Field, hl = "@field" },
					Constructor = { icon = icons.Constructor, hl = "@constructor" },
					Enum = { icon = icons.Enum, hl = "@type" },
					Interface = { icon = icons.Interface, hl = "@type" },
					Function = { icon = icons.Function, hl = "@function" },
					Variable = { icon = icons.Variable, hl = "@constant" },
					Constant = { icon = icons.Constant, hl = "@constant" },
					String = { icon = icons.String, hl = "@string" },
					Number = { icon = icons.Number, hl = "@number" },
					Boolean = { icon = icons.Boolean, hl = "@boolean" },
					Array = { icon = icons.Array, hl = "@constant" },
					Object = { icon = icons.Object, hl = "@type" },
					Key = { icon = icons.Key, hl = "@type" },
					Null = { icon = icons.Null, hl = "@type" },
					EnumMember = { icon = icons.EnumMember, hl = "@field" },
					Struct = { icon = icons.Struct, hl = "@type" },
					Event = { icon = icons.Event, hl = "@type" },
					Operator = { icon = icons.Operator, hl = "@operator" },
					TypeParameter = { icon = icons.TypeParameter, hl = "@parameter" },
					Component = { icon = icons.Component, hl = "@function" },
					Fragment = { icon = icons.Fragment, hl = "@constant" },
				},
			})
		end,
		keys = {
			{ "<leader>Js", "<cmd>SymbolsOutline<cr>", desc = "Toggle Outline" },
		},
	},
	{
		"zeioth/project.nvim",
		cmd = "ProjectRoot",
		ft = { "java" },
		opts = {
			-- How to find root directory
			patterns = {
				"build.gradle",
				"pom.xml",
			},
			-- Don't list the next projects
			exclude_dirs = {
				"~/",
			},
			silent_chdir = true,
			manual_mode = false,

			-- Don't chdir for certain buffers
			exclude_chdir = {
				filetype = { "", "OverseerList", "alpha" },
				buftype = { "nofile", "terminal" },
			},

			--ignore_lsp = { "lua_ls" },
		},
		config = function(_, opts)
			require("project_nvim").setup(opts)
		end,
	},
}
return M
