_G.idxOf = function(array, value)
	for i, v in ipairs(array) do
		if v == value then
			return i
		end
	end
	return nil
end

_G.LAZYGIT_TOGGLE = function()
	local ok = pcall(require, "toggleterm")
	if not ok then
		print("Toggleterm not found !")
	else
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
		lazygit:toggle()
	end
end

_G.substring = function(text, key)
	local index, _ = string.find(text, key)
	if index then
		return true
	else
		return false
	end
end

_G.all_trim = function(s)
	return s:match("^%s*(.-)%s*$")
end

return {}
