local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	ignorecase = true, -- ignore case in search patterns
	inccommand = "split",
	pumheight = 10, -- pop up menu height
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	softtabstop = 4,
	cursorline = true, -- highlight the current line
	termguicolors = true,
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 3, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	breakindent = true,
	scrolloff = 8,
	sidescrolloff = 8,
	mousehide = true, -- hide mouse pointer while typing
	report = 0, -- always display report of changed lines
	laststatus = 3, -- Display a global status line for all open buffers
	pumblend = 20,
	spell = false,
	spelllang = "el,en",
	shortmess = "flmnrwxtToOFac",
	formatoptions = "tcrqnb",
	list = false,
	listchars = "tab:>-,eol:$,trail:-,precedes:<,extends:>,nbsp:+",
	langmap = "ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz",
}

vim.opt.diffopt:append("algorithm:patience") -- better diffing: https://vimways.org/2018/the-power-of-diff/
vim.opt.diffopt:append("indent-heuristic")
vim.opt.diffopt:append("linematch:60")
vim.opt.path:append({ "**" }) -- Search files in subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])

vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.ruby_host_prog = "/usr/bin/ruby"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
