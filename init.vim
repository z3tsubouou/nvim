:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set encoding=utf-8
" TextEdit might fail if hidden is not set.
:set hidden

" Some servers have issues with backup files, see #649.
:set nobackup
:set nowritebackup

" Give more space for displaying messages.
:set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
:set shortmess+=c

:set completeopt-=preview " For No Previews
:set updatetime=100

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  :set signcolumn=number
else
  :set signcolumn=yes
endif

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/numToStr/Comment.nvim' " For Commenting gcc & gc
Plug 'https://github.com/nvim-lualine/lualine.nvim' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/kyazdani42/nvim-web-devicons' " Icons for diffview
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/airblade/vim-gitgutter' " gitgutter
Plug 'https://github.com/nvim-lua/plenary.nvim' " finder helper
Plug 'https://github.com/nvim-telescope/telescope.nvim' " finder
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " language highlighter
Plug 'https://github.com/phaazon/hop.nvim' " jump between words
Plug 'https://github.com/lewis6991/impatient.nvim' " speed up neovim
Plug 'https://github.com/sindrets/diffview.nvim' " git diff
Plug 'https://github.com/romgrk/barbar.nvim' " tab manager
Plug 'https://github.com/RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " color 
Plug 'https://github.com/mhinz/vim-startify' " recent folders
Plug 'https://github.com/APZelos/blamer.nvim' " gitlens
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim' " indent blankline

call plug#end()

" nert tree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" telescope
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<CR>
nnoremap fb :Telescope buffers<CR>
nnoremap fh :Telescope help_tags<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" barbar
nnoremap tn :BufferNext <CR>
nnoremap tp :BufferPrevious <CR>
nnoremap tc :BufferClose <CR>

" HopWord
nnoremap <C-h> :HopWord <CR>

" move line
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" auto bracket completion
" inoremap { {}<Esc>ha
" inoremap ( ()<Esc>ha
" inoremap [ []<Esc>ha
" inoremap " ""<Esc>ha
" inoremap ' ''<Esc>ha
" inoremap ` ``<Esc>ha

nmap <F8> :TagbarToggle<CR>

noremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

:colorscheme tender

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeWinPos = "right"
let g:NERDTreeIgnore = ['^build$', '^node_modules$', '^dist$']
let NERDTreeShowHidden=1

let g:python3_host_prog = "/usr/bin/python3" 

let g:gitgutter_realtime = 1  
let g:gitgutter_sign_allow_clobber = 1

let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:false

" Enable/disable auto-hiding the tab bar when there is a single buffer
let bufferline.auto_hide = v:true

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" Excludes buffers from the tabline
" let bufferline.exclude_ft = ['javascript']
" let bufferline.exclude_name = ['package.json']

" Enable/disable icons
" if set to 'buffer_number', will show buffer number in the tabline
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
" if set to 'buffer_number_with_icon', will show buffer number and icons in the tabline
let bufferline.icons = v:true

" Sets the icon's highlight group.
" If false, will use nvim-web-devicons colors
let bufferline.icon_custom_colors = v:false

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'
let bufferline.icon_pinned = '車'

" If true, new buffers will be inserted at the start/end of the list.
" Default is to insert after current buffer.
let bufferline.insert_at_start = v:false
let bufferline.insert_at_end = v:false

" Sets the maximum padding width with which to surround each tab.
let bufferline.maximum_padding = 4

" Sets the maximum buffer name length.
let bufferline.maximum_length = 30

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP'

" Sets the name of unnamed buffers. By default format is "[Buffer X]"
" where X is the buffer number. But only a static string is accepted here.
let bufferline.no_name_title = v:null

let g:blamer_enabled = 1

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
lua << EOF
require('impatient')
require('hop').setup()
require('nvim-web-devicons').setup {}
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "javascript", "typescript", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = false,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
	show_end_of_line = true,
}
require('lualine').setup {
	options = {
		theme = 'moonfly',
	},
	extensions = {
		'nerdtree'
	}
}
require('Comment').setup()
EOF

