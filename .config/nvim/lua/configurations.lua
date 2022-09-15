-- numToStr/Comment.nvim
require("Comment").setup()

-- tpope/vim-closetag
vim.g.closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'

-- junegenn/fzf.vim
vim.g.fzf_command_prefix = 'Fuzzy'
vim.g.fzf_history_dir = '~/.local/share/fzf-history'
vim.g.fzf_buffers_jump = 1

-- simrat39/symbols-outline
require("symbols-outline").setup()

-- lewis6991/gitsigns
require('gitsigns').setup()

-- nvim-treesitter/nvim-treesitter
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { -- A list of parser names, or "all"
		"bash",
		"html",
		"javascript",
		"json",
		"typescript",
		"python",
		"vim"
	},
	auto_install = true, -- Automatically install missing parsers when entering buffer
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true
	},
  indent = {
    enable = true
  }
}

-- p00f/nvim-ts-rainbow
require("nvim-treesitter.configs").setup {
  rainbow = {
    enable = true,
    disable = {}, -- list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 500, -- Do not enable for files with more than n lines, int
  }
}

-- kyazdani42/nvim-tree.lua
require("nvim-tree").setup({
	actions = {
		open_file = {
			quit_on_open = true
		}
	}
})


-- VonHeikemen/lsp-zero.nvim
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.set_preferences({ set_lsp_keymaps = false })
lsp.nvim_workspace()
lsp.on_attach(function(_, bufnr)
  local noremap = {buffer = bufnr, remap = false}
  local set = vim.keymap.set

  set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap)
  set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap)
  set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', noremap)
  set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', noremap)
  set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', noremap)
  set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap)
  set('n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<cr>', noremap)
  set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<cr>', noremap)
  set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', noremap)
  set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', noremap)
  set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap)
  set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap)
end)
lsp.setup()

-- hrsh7th/nvim-cmp
local cmp = require'cmp'

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['q'] = cmp.mapping.abort(),
		['<C-l>'] = cmp.mapping.confirm(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.scroll_docs(4),
		['<C-p>'] = cmp.mapping.scroll_docs(-4),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
})
