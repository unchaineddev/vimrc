set encoding=utf-8 
set nocompatible              " be iMproved, required
filetype on                 " required


" ----- BEGIN Vundle Plugin Manager -----

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

"FZF 
Plugin 'junegunn/fzf'
" Color schemes for Vim 
Plugin 'morhetz/gruvbox'
"Indent Line
Plugin 'Yggdroot/indentLine' 
" Nerd Tree
Plugin 'preservim/nerdtree'
" You Complete Me
Plugin 'ycm-core/YouCompleteMe'


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

"----- END VUNDLE PLUGIN Manager -----





" ----- color scheme -----

autocmd vimenter * ++nested colorscheme gruvbox 
let g:gruvbox_contrast_dark='hard'
set background=dark
hi Normal guibg=NONE ctermbg=NONE

"-------------------------


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

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

"set statusline+=%#LineNr#
"set statusline+=\ %f

"  }}}


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

" Set tab spaces to 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

":tabnew filename
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>


" Auto Indent 
set autoindent 
" Use '>' to tab a block

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" ----- Clipboard Related -----

" Set clipboard to sysem clipboard 
set clipboard=unnamedplus 

" while pasting, use :set paste 
" after you finish pasting, use :set nopaste


"https://vim.fandom.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
vmap xyy :!xclip -f -sel clip <CR>
map xpp  mz:-1r !xclip -o -sel clip<CR>`z

"------------------------------


" Compile/Run code by Filetype
autocmd FileType python map <buffer><C-c> :w<CR>:exec '!python3' shellescape (@%,1)<CR>
autocmd FileType python imap <buffer><C-c> <esc>:w<CR>:exec '!python3' shellescape (@%,1)<CR> 
" YAML 
"autocmd Filetype yaml set cursorcolumn
"autocmd Filetype yml set cursorcolumn
"autocmd Filetype  set cursorcolumn


" Set Split 
set splitbelow splitright


"----- Plugin Related -----

" FZF notes - Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to open in a new tab, a new split, or in a new vertical split.

"Comment the selected block out with: :norm i# (lower case i)
"To uncomment, highlight your block again, and uncomment with: :norm ^x



" -----Indent Line-----
let g:indentLine_setColors = 0
"let g:indentLine_color_term = 239
"let g:indentLine_setConceal = 0
"let g:indentLine_char = '┆'
":IndentLinesToggle
"


" NERD TREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree


" You complete me
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path='/usr/bin/python3'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
