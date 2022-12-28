local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'fatih/vim-go'
  use 'nvim-tree/nvim-tree.lua'
  use 'rktjmp/lush.nvim'

  use "terrortylor/nvim-comment"
  use 'whatyouhide/vim-gotham'
  use 'nvim-tree/nvim-web-devicons'
  use 'nyoom-engineering/oxocarbon.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'mhinz/vim-startify'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = {{'nvim-lua/plenary.nvim'}}
  }
  use 'github/copilot.vim'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-fugitive'






  -- LSP CONF
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }



  if packer_bootstrap then
    require('packer').sync()
  end
end)
