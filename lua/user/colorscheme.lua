local colorscheme = "Eva-Dark"
local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
	print("Color scheme '" .. colorscheme .. "' not found!")
end
