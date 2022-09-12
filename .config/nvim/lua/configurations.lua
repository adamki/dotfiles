-- vim closetag
vim.g.closetag_filenames = '*.html,*.jsx,*.js,*.tsx,*.html.erb'

-- junegenn/fzf.vim
vim.g.fzf_command_prefix = 'Fuzzy'
vim.g.fzf_history_dir = '~/.local/share/fzf-history'
vim.g.fzf_buffers_jump = 1

-- lukas-reineke/indent-blankline
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#464646 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#616161 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#7e7e7e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#AAAAAA gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#c1c1c1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#dddddd gui=nocombine]]

require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

-- luochen1990/rainbow
vim.g.rainbow_active = 1

-- neoclide/coc
vim.cmd([[
  let g:coc_global_extensions = [
    \'coc-css',
    \'coc-eslint',
    \'coc-explorer',
    \'coc-git',
    \'coc-highlight',
    \'coc-html',
    \'coc-json',
    \'coc-pyright',
    \'coc-snippets',
    \'coc-tsserver',
    \'coc-vimlsp',
    \'coc-yank',
    \]

	autocmd CursorHold * silent call CocActionAsync('highlight')
	let g:coc_disable_transparent_cursor = 1
]])

