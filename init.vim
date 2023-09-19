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
let mapleader = " "

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

"Telescope
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>
nnoremap fj <cmd>Telescope jumplist<cr>

"Delete Buffer
nnoremap db :bd<Cr>
