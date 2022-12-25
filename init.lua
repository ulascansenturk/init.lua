require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme tokyonight]])

vim.opt.signcolumn = 'yes'

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})



