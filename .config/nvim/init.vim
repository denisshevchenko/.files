" These settings are specific for Haskell development (stack-based) with NeoVim.

" This is the place where plugins will be loaded.
call plug#begin('~/.local/share/nvim/plugged')

" For fast searching in project. And don't forget make 'sudo apt install ack-grep'.
Plug 'mileszs/ack.vim'

" Auto pairs for braces.
Plug 'jiangmiao/auto-pairs'

" Great autocomplete engine.
" And don't forget to install Python3 interface with 'pip3 install neovim' command.
Plug 'Shougo/deoplete.nvim'

" Powerful file tree.
Plug 'scrooloose/nerdtree'

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

" Intero, Haskell development tool.
Plug 'parsonsmatt/intero-neovim'

" Plug 'nbouscal/vim-stylish-haskell'
" Plug 'vim-scripts/hlint'

Plug 'joshdick/onedark.vim'

" Initialize plugin system.
call plug#end()

" Shows line numbers.
set nu

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Shows syntax highlighting.
syntax on
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

set nofoldenable

" Search done right.
set hlsearch
set incsearch

set tm=5

set mouse=a
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
map <C-n> :NERDTreeToggle<CR>

" Esc key in Terminal - back to Normal mode.
tnoremap <Esc> <C-\><C-n>

" Cursive comments are great IMHO.
" highlight Comment cterm=italic

" Deoplete always starts automatically.
let g:deoplete#enable_at_startup = 1

set statusline+=%#warningmsg#

" For folder icons in NERDTree.
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" let g:syntastic_check_on_open = 1

" Haskell syntax tuning.
let g:haskell_classic_highlighting = 1
let g:haskell_enable_quantification = 1
let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_in = 0

" highlight Comment term=bold ctermfg=Cyan

" hi Comment      ctermfg=lightblue

" Custom :make command for stack-based Haskell projects.
" Always check current file, so we can build project any time.
autocmd BufEnter * silent! lcd %:p:h
set makeprg=stack\ install

" Hide line numbers in terminal inside of NeoVim.
augroup TerminalStuff
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  " au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0
