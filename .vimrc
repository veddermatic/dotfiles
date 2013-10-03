" Pathogen ---- {{{
filetype off " Pathogen needs to run before plugin indent on
call pathogen#runtime_append_all_bundles()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin indent on
" }}}

" General settings ---- {{{
syntax enable
let mapleader = ","
let maplocalleader = "\\"
set number
" set cursorline " highlights the active ine (but removes syntax)
set numberwidth=5
set statusline=%f\ -\ %y%=col:%3c\ row:%4l:%-4L
set laststatus=2 " always show the status line
" below copied form my old one. Figure out what they do
set nocompatible " make vim act like vim, not vi
set nobackup " do not create and save backup files
set tabstop=4 " tab counts as 4 spaces
set softtabstop=4 " make spces like tabs when deleting
set shiftwidth=4 " number of spaces to move text with '>>' and '<<'
set backspace=2 " set backspace=indent,eol,start
set expandtab " turn tabs into spaces
set showmode " say what mode we are in
" set showcmd " show our last command for some reason...
" set ruler
" set rulerformat=%40(%=%t%h%m%r%w%<\ (%n)\ %4.7l,%-7.(%c%V%)\ %P%)
set hlsearch " hilight ALL matching text. I think I don't like it any more
set showmatch " flip to matching paren when you type the 2nd one for....
set matchtime=1 " ... this many 10ths of a second
set hl=l:Underlined " how to hilight search text (was Visual .. trying this for now)
set incsearch " jump in the file to matches of the pattern we are searching
set confirm " ask us if we *really* want to do someting that might be dumb
set autoindent " keep line indent for us on new line...
set smartindent " ... unless we did a brace or something, then indent even more!
set scrolloff=5 " always show a few lines under the one we are working on for context!
set hid "change buffer w/o annoying for save
set shortmess=aOstTI "removes many ENTER TO CONTINUE messages
set wrap " soft wrap text
set linebreak " rules for breaking lines
" turn off auto commenting!!!
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}

" Folding --- {{{
set foldmethod=indent " Fold by indent level by default
set nofoldenable " Don't fold code by default
"set foldnestmax=3 " only fold two levels deep. (personal preference)
set foldlevel=99
" }}}

" VIM Command shortcuts / remapping {{{
command! W w " because I always type 'W' to save by accident
" switch to previous buffer
noremap <leader>1 :bprev<cr>
" switch to next buffer
noremap <leader>2 :bnext<cr> 
" close current buffer but leave others open
noremap <leader>4 :Bclose<cr>
" }}}

" Manipulate lines --- {{{
" move current line under the last line (swap with one above)
noremap <leader>- ddp
" move current line above the previous line (swap with one above)
noremap <leader>_ ddkP
" add blank line above this one
nnoremap <leader>O O<esc>j
" add blank line under this one
nnoremap <leader>o o<esc>k
" }}}

" Manipulate words ---- {{{
" convert current word to UPPER (in insert mode)
inoremap <leader>u <esc>viwUei
" convert current word to UPPER (in normal mode)
nnoremap <leader>u viwUe
" surround current word with double quotes
nnoremap <leader>" viw<esc>a"<esc>Bi"<esc>E
" surround currnet word with single quotes
nnoremap <leader>' viw<esc>a'<esc>Bi'<esc>E
" }}}

" Steal Steve Losh's Good Ideas ---- {{{
" pop open your vimrc in a split!
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source your vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Break bad habits ---- {{{
" you will eventually learn to stop using ESC
inoremap <esc> ###
" use this instead of ESC!
inoremap jk <esc>
" no arrow keys for you!
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
" }}}

" Programming shortcuts --- {{{
" comment out line (js)
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType javascript nnoremap <buffer> <localleader>uc ^xx 
" comment out line (python)
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
autocmd FileType python     nnoremap <buffer> <localleader>uc ^x 
" comment out line (css)
autocmd FileType css nnoremap <buffer> <localleader>c I/*<esc>A*/<esc>
autocmd FileType css nnoremap <buffer> <localleader>uc ^xx$xx
" add block stying to all images
autocmd FileType html nnoremap <localleader>ebs gg7ddG2k3dd/Table<cr>diW:%s/\(<a.*\)\n\s\+/\1/g<bar>%s/\(<td.*\)\n\s\+/\1/g<bar>%s/<td\(.*\)\( width="\d\+" height="\d\+"\)/<td\2\1\2/g<bar>%s/src=/style="display:block;" src=/g<cr>
" shortcut for "(i)nside (n)ext set of (p)arenthesis
onoremap inp :<c-u>normal! f(vi(<cr>
" shortcut for "(i)nside (l)ast set of (p)arenthesis
onoremap ilp :<c-u>normal! F(vi(<cr>
" }}}

" I tipe Gud ---- {{{
iabbrev teh the
iabbrev fuction function
iabbrev fucntion function
iabbrev stauts status
" }}}

" Vimscript file settings ---- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
"
" PLUGINS
"
" ---- Syntastic {{{
"show syntatic error location list
nnoremap <localleader>se :Errors<cr>
" check syntax
nnoremap <localleader>sc :SyntasticCheck<cr>
" }}}

" ---- NERD TREE {{{ 
nnoremap <leader>6 :NERDTreeToggle<cr>
let g:NERDChristmasTree = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 50
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['^\._','\.swp$', '\.git$', '\.svn$', '\.jpg$', '\.gif$', '\.png$', '\.pyc', '\.DS_Store', '\.hg', '\.git']
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeSortOrder = ['\/$', '*']
" }}}

"---- MINIBUFEXPL {{{
" let g:miniBufExplMapWindowNavArrows = 1
" move up to minibuff
nnoremap <localleader>be <c-w>k
" }}}

" ---- make things pretty {{{
colorscheme freya
" }}}
