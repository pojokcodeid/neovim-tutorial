return {
	{
		"nvim-cmp",
		dependencies = {
			{
				"Exafunction/codeium.nvim",
				cmd = "Codeium",
				build = ":Codeium Auth",
				opts = {
					enable_chat = true,
				},
			},
		},
		opts = function(_, opts)
			table.insert(opts.sources, 1, {
				name = "codeium",
				group_index = 1,
				priority = 100,
			})
		end,
	},
}
