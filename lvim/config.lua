-- local vars
local keymap = vim.keymap.set
local tbuiltin = require("telescope.builtin")

-- key mappings
keymap("n", "<space>lg", tbuiltin.live_grep, {})
keymap("n", "<space>x", tbuiltin.treesitter)

keymap('i', 'jj', '<esc>')
keymap('i', 'kk', '<esc>')


lvim.transparent_window = true

lvim.keys.normal_mode["<s-l>"] = ":bufferlinecyclenext<cr>"
lvim.keys.normal_mode["<s-h>"] = ":bufferlinecycleprev<cr>"
lvim.keys.normal_mode["<c-s>"] = ":w<cr>"


-- go
keymap("n", "fmt", ":gofmt<cr>")
keymap("n", "mmm", ":gofillstruct<cr>")
keymap("n", "gt", ":gotest<cr>")
keymap("n", "gtf", ":gotestfunc<cr>")

keymap("n", "gmm", ":goimplements<cr>")


keymap("n", ",,", ":resize +10<cr>")



--  general
lvim.builtin.lualine.style = "none"




lvim.log.level = "info"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex", "ruby", "go", "json", "yaml",
  "solidity" }
vim.opt.termguicolors = true

lvim.colorscheme = 'nightfox'


lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}


-- stlye linting
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua" },
  {
    command = "prettier",
    extra_args = { "--print-width", "100" },
    filetypes = { "typescript", "typescriptreact" },
  },
  { command = "rubocop",   filetypes = { "ruby" } },
  { command = "goimports", filetypes = { "go" } },
  { command = "gofmt",     filetypes = { "go" } },
})
-- local linters = require("lvim.lsp.null-ls.linters")


-- linters.setup({
--   { command = "flake8",        filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
--   { command = "golangci-lint", filetypes = { "go" } },
-- })


-- plugins
lvim.plugins = {
  {
    "karb94/neoscroll.nvim",
    event = "winscrolled",
    config = function()
      require("neoscroll").setup({
        -- all these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<c-u>", "<c-d>", "<c-b>", "<c-f>", "<c-y>", "<c-e>", "zt", "zz", "zb" },
        hide_cursor = true,          -- hide cursor while scrolling
        stop_eof = true,             -- stop at <eof> when scrolling downwards
        use_local_scrolloff = false, -- use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- the cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- default easing function
        pre_hook = nil,              -- function to run before the scrolling animation starts
        post_hook = nil,             -- function to run after the scrolling animation ends
      })
    end,
  },
  {
    "fatih/vim-go",
  },
  {
    'rcarriga/nvim-notify'
  },
  {
    'stevearc/dressing.nvim',
  },
  {
    'bluz71/vim-moonfly-colors'
  },
  {
    'ellisonleao/gruvbox.nvim'
  },
  {
    'rebelot/kanagawa.nvim'
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "copilot",
    event = "insertenter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp',
  },
  {
    "edeneast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local palette = require("nightfox.palette").load("nightfox")
      require("nightfox").setup({
        options = { transparent = true },
        groups = {
          all = {
            telescopeborder = { fg = palette.fg3 },
          },
          nightfox = {
            visual = { bg = palette.bg1 },
          },
        },
      })
      vim.cmd.colorscheme("nightfox")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    opts = {},
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    },
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
  }




}


require("dressing").setup({
  input = {
    -- set to false to disable the vim.ui.input implementation
    enabled = true,

    -- default prompt string
    default_prompt = "input:",

    -- can be 'left', 'right', or 'center'
    title_pos = "left",

    -- when true, <esc> will close the modal
    insert_only = true,

    -- when true, input will start in insert mode.
    start_in_insert = true,

    -- these are passed to nvim_open_win
    border = "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "cursor",

    -- these can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    buf_options = {},
    win_options = {
      -- window transparency (0-100)
      winblend = 10,
      -- disable line wrapping
      wrap = false,
      -- indicator for when text exceeds window
      list = true,
      listchars = "precedes:…,extends:…",
      -- increase this for more context when text scrolls off the window
      sidescrolloff = 0,
    },

    -- set to `false` to disable
    mappings = {
      n = {
        ["<esc>"] = "close",
        ["<cr>"] = "confirm",
      },
      i = {
        ["<c-c>"] = "close",
        ["<cr>"] = "confirm",
        ["<up>"] = "historyprev",
        ["<down>"] = "historynext",
      },
    },

    override = function(conf)
      -- this is the config that will be passed to nvim_open_win.
      -- change values here to customize the layout
      return conf
    end,

    -- see :help dressing_get_config
    get_config = nil,
  },
  select = {
    -- set to false to disable the vim.ui.select implementation
    enabled = true,

    -- priority list of preferred vim.select implementations
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

    -- trim trailing `:` from prompt
    trim_prompt = true,

    -- options for telescope selector
    -- these are passed into the telescope picker directly. can be used like:
    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = nil,

    -- options for fzf selector
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },

    -- options for fzf-lua
    fzf_lua = {
      -- winopts = {
      --   height = 0.5,
      --   width = 0.5,
      -- },
    },

    -- options for nui menu
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "dressingselect",
      },
      win_options = {
        winblend = 10,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },

    -- options for built-in selector
    builtin = {
      -- display numbers for options and set up keymaps
      show_numbers = true,
      -- these are passed to nvim_open_win
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",

      buf_options = {},
      win_options = {
        -- window transparency (0-100)
        winblend = 10,
        cursorline = true,
        cursorlineopt = "both",
      },

      -- these can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },

      -- set to `false` to disable
      mappings = {
        ["<esc>"] = "close",
        ["<c-c>"] = "close",
        ["<cr>"] = "confirm",
      },

      override = function(conf)
        -- this is the config that will be passed to nvim_open_win.
        -- change values here to customize the layout
        return conf
      end,
    },

    -- used to override format_item. see :help dressing-format
    format_item_override = {},

    -- see :help dressing_get_config
    get_config = nil,
  },
})

table.insert(lvim.plugins, {
  "zbirenbaum/copilot-cmp",
  event = "insertenter",
  dependencies = { "zbirenbaum/copilot.lua" },
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/readme.md#setup-and-configuration
      require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/readme.md#configuration
    end, 100)
  end,
})



-- lvim.builtin.which_key.mappings["t"] = {
--   name = "diagnostics",
--   t = { "<cmd>troubletoggle<cr>", "trouble" },
--   w = { "<cmd>troubletoggle workspace_diagnostics<cr>", "workspace" },
--   d = { "<cmd>troubletoggle document_diagnostics<cr>", "document" },
--   q = { "<cmd>troubletoggle quickfix<cr>", "quickfix" },
--   l = { "<cmd>troubletoggle loclist<cr>", "loclist" },
--   r = { "<cmd>troubletoggle lsp_references<cr>", "references" },
-- }
--
--


vim.api.nvim_create_autocmd("bufwritepost", {
  pattern = "*.sol",
  callback = function()
    local foundry_project = vim.fn.glob("foundry.toml") ~= ""
    if foundry_project then
      vim.cmd("silent! !forge fmt")
    end
  end,
})
