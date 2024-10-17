return {
	settings = {
		Lua = {
			format = {
				enable = false, -- nonactifikkan pengeformatan
			},
			diagnostics = {
				globals = { "vim", "spec" }, -- tentukan global variable
			},
			runtime = {
				version = "LuaJIT", -- tentukan versi luajit
				special = {
					spec = "require", -- tentukan spec sebagai require
				},
			},
			workspace = {
				checkThirdParty = false,
			},
			hint = {
				enable = false, -- nonactifikkan hint
				arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
				await = true, -- actifkan pengecekan await
				paramName = "Disable", -- "All" | "Literal" | "Disable"
				paramType = true, -- actifkan type parameter
				semicolon = "All", -- "All" | "SameLine" | "Disable"
				setType = false, -- nonactifkan type set
			},
			telemetry = {
				enable = false, -- nonactifikan telemetry
			},
		},
	},
}
