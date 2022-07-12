:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/kyazdani42/nvim-web-devicons' " Icons for diffview
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/airblade/vim-gitgutter' " gitgutter
Plug 'https://github.com/nvim-lua/plenary.nvim' " finder helper
Plug 'https://github.com/nvim-telescope/telescope.nvim' " finder
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " language highlighter
Plug 'https://github.com/phaazon/hop.nvim' " jump between words
Plug 'https://github.com/lewis6991/impatient.nvim' " speed up neovim
Plug 'https://github.com/sindrets/diffview.nvim' " git diff

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

" tabs
nnoremap tn :tabn <CR>
nnoremap tp :tabp <CR>
nnoremap tN :tabnew <CR>
nnoremap tc :tabc <CR>

" move line
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews
:set updatetime=100

:colorscheme tender

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:python3_host_prog = "/usr/bin/python3" 
let g:gitgutter_realtime = 1  
let g:gitgutter_sign_allow_clobber = 1
let g:NERDTreeWinPos = "right"
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

lua << EOF
require('impatient')
require'hop'.setup()
require'nvim-web-devicons'.setup {}
require'nvim-treesitter.configs'.setup {
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
EOF

