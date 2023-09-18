" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

luafile ~/AppData/Local/nvim/luarc.lua

set termguicolors

set nocompatible                  " Must come first because it changes other options.
set mouse=a

set autoread
au CursorHold * checktime

" change leader key
" let mapleader = "a"
let mapleader=","

"syntax enable                     " Turn on syntax highlighting.
"filetype plugin indent on         " Turn on file type detection.

" runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set noshowmatch

set noswapfile
" set foldmethod=indent

" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
function! g:FuckThatMatchParen ()
  if exists(":NoMatchParen")
    :NoMatchParen
  endif
endfunction

augroup plugin_initialize
  autocmd!
  autocmd VimEnter * call FuckThatMatchParen()
augroup END

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest,full    " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set nohlsearch                    " Highlight matches.

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

let g:auto_save = 1               " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
set updatetime=1000

set undodir=~/.vim/.undo//

set backupdir=~/.vim/.backup//

set directory=~/.vim/.swp//

" let g:airline_theme='tomorrow'

set backupcopy=yes

" UNCOMMENT TO USE
set expandtab                    " Use spaces instead of tabs
set shiftwidth=2                 " And again, related.
set softtabstop=2                    " Global tab width.

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

" Or use vividchalk
" colorscheme gruvbox
" source monokai_pro

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" call plug#begin('~/.config/nvim/plugged')

" Plug 'mileszs/ack.vim'

" Plug 'https://github.com/pangloss/vim-javascript.git'

""NOT USING
" Plug 'tpope/vim-fugitive'
" Plug 'git://github.com/tpope/vim-speeddating.git'
" Plug 'https://github.com/tpope/vim-git.git'
" Plug 'mxw/vim-jsx'
" Plug 'https://github.com/leshill/vim-json.git'
" Plug 'https://github.com/danro/rename.vim.git'
"RUST
" Plug 'roxma/nvim-completion-manager'
" Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'
" Plug 'roxma/nvim-cm-racer'
"Plug 'OmniSharp/omnisharp-vim'
"Plug 'neovim/nvim-lspconfig' "native LSP support
"Plug 'hrsh7th/nvim-cmp' "autocompletion framework
"Plug 'hrsh7th/cmp-nvim-lsp' "LSP autocompletion provider
" Plug 'puremourning/vimspector'

"USING
" Plug 'git://github.com/tpope/vim-surround.git'

" Plug 'git://github.com/tpope/vim-commentary.git'

" Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" Plug 'https://github.com/elzr/vim-json.git'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'https://github.com/vim-scripts/vim-auto-save'

" Plug 'christoomey/vim-tmux-navigator'

" Plug 'https://github.com/shime/vim-livedown.git'

" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'williamboman/mason.nvim'
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'neovim/nvim-lspconfig'

" Initialize plugin system
" call plug#end()

nmap <leader>r :! cargo run<CR>

" neomake
nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Uncomment to use Jamis Buck's file opening plugin
" map <Leader>t :FuzzyFinderTextMate<Enter>
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set autochdir

"NERD TREE
" Give a shortcut key to NERD Tree
" nnoremap <F7> :NERDTreeToggle<CR>

" augroup nerdtree_open
"     autocmd!
"     autocmd VimEnter * NERDTree | wincmd p
" augroup END


"Telescope
" Find files using Telescope command-line sugar.
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>
