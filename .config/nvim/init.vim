" These settings are specific for Haskell development (stack-based) with NeoVim.

" This is the place where plugins will be loaded.
call plug#begin('~/.local/share/nvim/plugged')

" For fast searching in project. And don't forget make 'sudo apt install ack-grep'.
Plug 'mileszs/ack.vim'

" Great autocomplete engine.
" And don't forget to install Python3 interface with 'pip3 install neovim' command.
Plug 'Shougo/deoplete.nvim'

" Powerful file tree.
Plug 'scrooloose/nerdtree'

" Start default system app right in NERDTree menu.
" Plug 'ivalkeen/nerdtree-execute'

" Autocomplete with <TAB> key.
Plug 'ervandew/supertab'

" Autoindent with patterns.
Plug 'godlygeek/tabular'

" Powerful status of project (filetype, encoding, mode, etc.).
Plug 'vim-airline/vim-airline'

" Themes for Airline.
Plug 'vim-airline/vim-airline-themes'

" Glyphs for filetypes etc.
Plug 'ryanoasis/vim-devicons'

" Wrapper around git, run git commands right in editor.
Plug 'tpope/vim-fugitive'

" Shows git status for curent file/branch.
Plug 'airblade/vim-gitgutter'

" Nix support.
Plug 'spwhitt/vim-nix'

" Haskell.
Plug 'neovimhaskell/haskell-vim'

" Plug 'vim-scripts/hlint'

Plug 'joshdick/onedark.vim'

" Support of stylish-haskell right in Vim.
" Plug 'nbouscal/vim-stylish-haskell'

Plug 'derekelkins/agda-vim'

" GHCid
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" Initialize plugin system.
call plug#end()

" Shows line numbers.
set nu

" Shows syntax highlighting.
syntax on

" Color scheme.
colorscheme onedark

" Use plugins/indentation based on filetype.
filetype on
filetype plugin on
filetype indent on

" Just in case. ;-)
set encoding=utf8

" Sets the theme for Airline.
let g:airline_theme='onedark'

" Devicons fonts for Airline.
let g:airline_powerline_fonts=1

" Simplify commands inserting, use ';' as ':', it's the same key anyway. ;-)
nnoremap ; :

" No useless trash.
set noswapfile

" Disable folding.
set nofoldenable

" Search done right.
set hlsearch
set incsearch

" Timeout is 5 instead of (default) 500.
set tm=5

set mouse=a

" Hide the mouse when typing text.
set mousehide

" 4 spaces on <TAB> by default.
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" Work with system clipboard, always. And don't forget 'sudo apt install xclip'.
set clipboard+=unnamedplus

" It's Vim, no arrows keys please. ;-)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Make the gutters darker than the background.
let g:badwolf_darkgutter = 1

" Esc key in Terminal - back to Normal mode.
tnoremap <Esc> <C-\><C-n>

" Italic comments are great IMHO.
" highlight Comment cterm=italic

" Deoplete always starts automatically.
let g:deoplete#enable_at_startup = 1

set statusline+=%#warningmsg#

" For folder icons in NERDTree.
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Ctrl+N -> on or off NERDTree.
map <C-n> :NERDTreeToggle<CR>
" Remove arrows near directories in NERDTree.
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"

" Haskell syntax tuning.
let g:haskell_classic_highlighting = 1
let g:haskell_enable_quantification = 1
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_in = 0

" Custom :make command for stack-based Haskell projects.
" Always check current file, so we can build project any time.
autocmd BufEnter * silent! lcd %:p:h
set makeprg=stack\ install

command Mk :make

" To fix highlighting problems.
autocmd BufEnter * :syntax sync fromstart

" Hide line numbers in terminal emulator inside of NeoVim.
augroup TerminalStuff
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Show trailing spaces.
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Use 'ag' in Ack commands.
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Do not jump to the first result of search automatically.
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
