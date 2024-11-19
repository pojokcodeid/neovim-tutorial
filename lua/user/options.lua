local options = {
	backspace = vim.opt.backspace + { "nostop" }, -- Jangan hentikan backspace saat insert
	clipboard = "unnamedplus", -- Koneksi ke clipboard sistem
	cmdheight = 0, -- Sembunyikan command line kecuali dibutuhkan
	completeopt = { "menuone", "noselect" }, -- Opsi untuk penyelesaian mode insert
	copyindent = true, -- Salin indentasi sebelumnya pada autoindenting
	cursorline = true, -- Sorot baris teks dari kursor
	expandtab = true, -- Aktifkan penggunaan spasi di tab
	fileencoding = "utf-8", -- Pengkodean konten file untuk buffer
	fillchars = { eob = " " }, -- Nonaktifkan `~` pada baris yang tidak ada
	history = 100, -- Jumlah perintah yang diingat dalam tabel riwayat
	ignorecase = true, -- Pencarian tidak peka huruf besar kecil
	laststatus = 3, -- globalstatus
	guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
	lazyredraw = false, -- Layar digambar ulang dengan malas
	mouse = "a", -- Aktifkan dukungan mouse
	number = true, -- Tampilkan garis nomor
	preserveindent = true, -- Pertahankan struktur indentasi sebanyak mungkin
	pumheight = 10, -- Tinggi menu pop up
	relativenumber = true, -- Tampilkan garis nomor relatif
	scrolloff = 8, -- Jumlah baris untuk menjaga di atas dan di bawah kursor
	shiftwidth = 2, -- Jumlah spasi yang dimasukkan untuk indentasi
	showmode = false, -- Nonaktifkan menampilkan mode di command line
	showtabline = 2, -- Selalu tampilkan tabline
	sidescrolloff = 8, -- Jumlah kolom untuk menjaga di sisi kursor
	signcolumn = "yes", -- Selalu tampilkan kolom tanda
	smartcase = true, -- Pencarian peka huruf besar kecil
	splitbelow = true, -- Membagi jendela baru di bawah jendela saat ini
	splitright = true, -- Membagi jendela baru di kanan jendela saat ini
	swapfile = false, -- Nonaktifkan penggunaan swapfile untuk buffer
	tabstop = 2, -- Jumlah spasi dalam tab
	termguicolors = true, -- Aktifkan warna RGB 24-bit di TUI
	timeoutlen = 300, -- Panjang waktu tunggu untuk urutan yang dipetakan
	undofile = true, -- Aktifkan undo yang persisten
	updatetime = 300, -- Panjang waktu tunggu sebelum memicu plugin
	wrap = false, -- Nonaktifkan pembungkusan baris lebih panjang dari lebar jendela
	writebackup = false, -- Nonaktifkan membuat cadangan sebelum menimpa file
	guifont = "Hasklug Nerd Font:h15", -- font yang digunakan dalam aplikasi neovim grafis
	whichwrap = "bs<>[]hl", -- Kunci "horizontal" yang diizinkan untuk berpindah ke baris sebelumnya/selanjutnya
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "http" },
	callback = function()
		local opt = vim.opt
		opt.number = false
		opt.preserveindent = false
		opt.relativenumber = false
	end,
})
