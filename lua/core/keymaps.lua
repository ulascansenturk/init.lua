

vim.opt.background = "dark"

vim.cmd([[colorscheme oxocarbon]])



-- getmetatable("").__index = function(str, i) return string.sub(str, i, i) end
vim.o.termguicolors = true
vim.cmd("syntax on")
vim.o.mouse = "a"
vim.o.visualbell = true
vim.o.errorbells = false
vim.o.showcmd = true

vim.o.showmode = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.ttyfast = true
vim.o.autowrite = true
vim.o.autoread = true
vim.o.updatetime = 300
vim.o.cmdheight = 2
vim.o.shortmess = vim.o.shortmess .. "c"

-- vim.o.re=0
vim.cmd([[set re=0]])

vim.opt.guifont = { "Source Code Pro", ":h12" }

vim.o.splitright = true
vim.o.splitbelow = true
vim.o.backspace = "indent,eol,start"
vim.wo.number = true
vim.wo.wrap = false
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.o.hidden = true
vim.o.showtabline = 2

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.bo.expandtab = true
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.cmd("set ts=2") -- Insert 2 spaces for a tab
vim.cmd("set sw=2") -- Change the number of space characters inserted for indentation
vim.cmd([[set smartindent]])
vim.o.shiftround = true
-- vim.o.diffopt = vim.o.diffopt .. "vertical"

vim.o.scrolloff = 5
vim.cmd("set inccommand=split") -- Make substitution work in realtime
vim.cmd([[set list listchars=tab:\ \ ,trail:·,nbsp:·]])
vim.cmd([[set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store,*/node_modules/*]])

-- set working directory to current buffer's directory
vim.cmd([[autocmd BufEnter * silent! lcd %:p:h]])

-- remove whitespace on save
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- color columns
vim.cmd([[autocmd BufNewFile,BufReadPost *.js,*.ts,*.tsx setl colorcolumn=80,120]])







vim.g.mapleader = " "
vim.g.mapLocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline =  true
vim.opt.autoread = true




vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n','<leader>h',':nohlsearch<CR>')

vim.keymap.set('n','fmt', ':GoFmt<CR>')

vim.keymap.set('n','mmm', ':GoImports<CR>')


