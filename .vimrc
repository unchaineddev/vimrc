set encoding=utf-8 
set nocompatible              " be iMproved, required
filetype on                 " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Color schemes for Vim 
Plugin 'morhetz/gruvbox'

"FZF 
Plugin 'junegunn/fzf'

"Indent Line
Plugin 'Yggdroot/indentLine' 

" Auto Complete

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





" setting color scheme 

autocmd vimenter * ++nested colorscheme gruvbox 
let g:gruvbox_contrast_dark='hard'
set background=dark
hi Normal guibg=NONE ctermbg=NONE


" Show Line numbers
set number relativenumber

" Turn on syntax highlighting 
syntax on
 

" Set Highlight Search Pattern
set hlsearch
set ignorecase
set smartcase
set incsearch
nnoremap <esc> :noh<return><esc>

" Set clipboard to sysem clipboard 
set clipboard=unnamedplus 

"https://vim.fandom.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
vmap xyy :!xclip -f -sel clip <CR>
map xpp  mz:-1r !xclip -o -sel clip<CR>`z

" Compile/Run code by Filetype
autocmd FileType python map <buffer><C-c> :w<CR>:exec '!python3' shellescape (@%,1)<CR>
autocmd FileType python imap <buffer><C-c> <esc>:w<CR>:exec '!python3' shellescape (@%,1)<CR> 
" Set tab spaces to 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Auto Indent 
set autoindent 
" Use '>' to tab a block

" Set Split 
set splitbelow splitright


"Comment the selected block out with: :norm i# (lower case i)
"To uncomment, highlight your block again, and uncomment with: :norm ^x

" YAML 
"autocmd Filetype yaml set cursorcolumn
"autocmd Filetype yml set cursorcolumn
"autocmd Filetype  set cursorcolumn


" Toggle transparent background
 let t:is_transparent = 0
 function! Toggle_transparent()
    if t:is_transparent == 0
		hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
 endfunction
nnoremap <C-x> : call Toggle_transparent()<CR>



" while pasting, use :set paste 
" after you finish pasting, use :set nopaste


 " Clear status line when vimrc is reloaded.
 set statusline=

 " Status line left side.
 set statusline+=\ %F\ %M\ %Y\ %R

 " Use a divider to separate the left side from the right side.
 set statusline+=%=

 " Status line right side.
 set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

 " Show the status on the second to last line.
 set laststatus=2

 " }}}

