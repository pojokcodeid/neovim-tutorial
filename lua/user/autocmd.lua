local api = vim.api

-- Pengaturan umum
api.nvim_create_augroup("_general_settings", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	group = "_general_settings",
	callback = function()
		require("vim.highlight").on_yank({ higroup = "Visual", timeout = 200 }) -- Memberi highlight pada teks yang baru saja dicopy
	end,
})

api.nvim_create_autocmd("FileType", {
	group = "_general_settings",
	pattern = "qf",
	command = "set nobuflisted", -- Mengatur buffer agar tidak terdaftar di buffer list
})

-- Pengaturan Git
api.nvim_create_augroup("_git", { clear = true }) -- Membuat grup autocommand untuk git
api.nvim_create_autocmd("FileType", {
	group = "_git",
	pattern = "gitcommit",
	command = "setlocal wrap spell", -- Mengatur wrap dan spell check untuk file git commit
})

-- Pengaturan Markdown
api.nvim_create_augroup("_markdown", { clear = true }) -- Membuat grup autocommand untuk markdown
api.nvim_create_autocmd("FileType", {
	group = "_markdown",
	pattern = "markdown",
	command = "setlocal wrap spell", -- Mengatur wrap dan spell check untuk file markdown
})

-- Pengaturan Auto Resize
api.nvim_create_augroup("_auto_resize", { clear = true }) -- Membuat grup autocommand untuk auto resize
api.nvim_create_autocmd("VimResized", {
	group = "_auto_resize",
	command = "tabdo wincmd =", -- Menyesuaikan ukuran window saat Vim di-resize
})

-- Pengaturan Alpha
api.nvim_create_augroup("_alpha", { clear = true }) -- Membuat grup autocommand untuk alpha
api.nvim_create_autocmd("User", {
	group = "_alpha",
	pattern = "AlphaReady",
	command = "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2", -- Menyembunyikan tabline saat alpha siap dan menampilkan kembali saat buffer di-unload
})

-- Pengaturan Terminal
api.nvim_create_augroup("neovim_terminal", { clear = true }) -- Membuat grup autocommand untuk terminal
api.nvim_create_autocmd("TermOpen", {
	group = "neovim_terminal",
	command = "startinsert | set nonumber norelativenumber | nnoremap <buffer> <C-c> i<C-c>", -- Memasuki mode insert secara otomatis dan menonaktifkan nomor baris di buffer terminal
})

-- Fungsi untuk Membuat Direktori yang Tidak Ada pada BufWrite
local function MkNonExDir(file, buf)
	if vim.fn.empty(vim.fn.getbufvar(buf, "&buftype")) == 1 and not string.match(file, "^%w+://") then
		local dir = vim.fn.fnamemodify(file, ":h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p") -- Membuat direktori jika tidak ada
		end
	end
end

api.nvim_create_augroup("BWCCreateDir", { clear = true }) -- Membuat grup autocommand untuk membuat direktori
api.nvim_create_autocmd("BufWritePre", {
	group = "BWCCreateDir",
	callback = function(_)
		MkNonExDir(vim.fn.expand("<afile>"), vim.fn.expand("<abuf>")) -- Memanggil fungsi untuk membuat direktori yang tidak ada sebelum menyimpan buffer
	end,
})
