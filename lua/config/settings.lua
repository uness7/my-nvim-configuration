local Settings = {}

-- my settings
function Settings.setup()
	vim.opt.spell = true
	vim.opt.spelllang = { "en_us" }
	vim.g.maplocalleader = "\\"
	vim.o.number = true
	vim.o.relativenumber = true
	vim.opt.tabstop = 4
	vim.opt.softtabstop=4
	vim.opt.shiftwidth=4
	vim.expandtab = True 
	vim.opt.smartindent = true -- Do smart autoindenting when starting a new line
	vim.opt.list = true
	vim.opt.listchars:append("tab:> ")
	vim.opt.swapfile = false
	vim.opt.backup = false
	vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
	vim.opt.undofile = true
	vim.opt.hlsearch = false
	vim.opt.incsearch = true
	vim.opt.scrolloff = 8
	vim.opt.isfname:append("@-@")
	vim.opt.updatetime = 50
	vim.opt.colorcolumn = "90"
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
end

return Settings
