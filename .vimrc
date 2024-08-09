
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" vim-bootstrap

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.local/share/nvim/site/autoload/plug.vim')

let g:vim_bootstrap_langs = "python"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif


" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
"Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'preservim/nerdcommenter' " For code commenting powers
Plug 'preservim/nerdtree'
"" A bunch of useful language related snippets (ultisnips is the engine).
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'mileszs/ack.vim'
Plug 'jamessan/vim-gnupg'

call plug#end()

" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------
set background=dark
"let g:solarized_termcolors=256
" This needs to come last, otherwise the colors aren't correct.
syntax on

set clipboard=unnamedplus "requires +clipboard

" Formatting {
    set shiftwidth=4                " Use indents of 4 spaces instead of the default 8
    "set tabstop=4                   " An indentation every four columns
    set expandtab                   " Tell vim to only use space caharacters, never tab characters "
" Enable list mode
set list

" Configure listchars
set listchars=tab:\|\ ,trail:·
" }
" custom-mods {

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" change default keybinding to accept coc dropdown from Ctrl+y
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"
iab <expr> ttime strftime('%H:%M') " substitute the word ttime with the actual time

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"Disabling automatic comment insertion in vim
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:UltiSnipsExpandTrigger="<tab>"
set relativenumber
" map ctrl-backspace to clear whole word
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" Add full file path to your existing statusline
set statusline+=%F
" Hotkey for NERDTreeToggle
nnoremap <C-n> :NERDTreeToggle<CR>
" make mupdf default reader for vimtex
let g:vimtex_view_method = 'mupdf'
