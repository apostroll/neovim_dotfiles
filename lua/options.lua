local options = {
	backup = false,                          -- creates a backup file
	clipboard = 'unnamedplus',               -- allows neovim to access the system clipboard
	cmdheight = 2,                           -- more space in the neovim command line for displaying messages
	completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp
	conceallevel = 0,                        -- so that `` is visible in markdown files
	fileencoding = 'utf-8',                  -- the encoding written to a file
	hlsearch = true,                         -- highlight all matches on previous search pattern
	ignorecase = true,                       -- ignore case in search patterns
	pumheight = 10,                          -- pop up menu height
	showtabline = 2,                         -- always show tabs
	smartcase = true,                        -- smart case
	smartindent = true,                      -- make indenting smarter again
	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	swapfile = false,                        -- creates a swapfile
	timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true,                         -- enable persistent undo
	updatetime = 300,                        -- faster completion (4000ms default)
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = false,                       -- convert tabs to spaces
	shiftwidth = 4,                          -- the number of spaces inserted for each indentation
	tabstop = 4,                             -- insert 2 spaces for a tab
	softtabstop = 4,
	cursorline = true,                       -- highlight the current line
	number = true,                           -- set numbered lines
	relativenumber = true,                   -- set relative numbered lines
	numberwidth = 3,                         -- set number column width to 2 {default 4}
	signcolumn = 'yes',                      -- always show the sign column, otherwise it would shift the text each time
	wrap = false,                            -- display lines as one long line
	scrolloff = 8,
	sidescrolloff = 8,
	mousehide = true,                        -- hide mouse pointer while typing
	report = 0,                              -- always display report of changed lines
	hidden = true,                           -- allow closing a buffer with unsaved changes
	laststatus = 3,                          -- Display a global status line for all open buffers
	pumblend = 20,
	spell = false,
	spelllang = 'el,en',
	shortmess = 'flmnrwxtToOFac',
	formatoptions = 'tcrqnb',
	list = false,
	listchars = 'tab:>-,eol:$,trail:-,precedes:<,extends:>,nbsp:+',
	langmap = '??A,??B,??C,??D,??E,??F,??G,??H,??I,??J,??K,??L,??M,??N,??O,??P,QQ,??R,??S,??T,??U,??V,WW,??X,??Y,??Z,??a,??b,??c,??d,??e,??f,??g,??h,??i,??j,??k,??l,??m,??n,??o,??p,qq,??r,??s,??t,??u,??v,??w,??x,??y,??z',

}

vim.opt.diffopt:append 'algorithm:patience' -- better diffing: https://vimways.org/2018/the-power-of-diff/
vim.opt.diffopt:append 'indent-heuristic'

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]

vim.g.python3_host_prog = '~/.virtualenvs/neovim/bin/python3'
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
