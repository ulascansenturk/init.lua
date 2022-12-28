require("core.keymaps")
require("core.plugins")
require("core.plugin_config")



vim.opt.signcolumn = 'yes'

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})



