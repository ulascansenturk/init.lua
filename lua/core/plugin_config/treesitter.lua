require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua","ruby","go", "vim"},
  sync_install = true,
  auto_install = true,
  highlight = {enable = true},
}
