if has("gui_macvim")
    " MacVim font and color scheme
    set guifont=Inconsolata:h16
    " tab shorcuts
    noremap <M-S-[> :tabp<CR>
    noremap <M-S-]> :tabn<CR>
    set transp=5
endif

" Disable toolbar on MacVim / gVim
set go-=T
" put a line at 80 characters so I know when to stop!
set colorcolumn=80
" set statusline=%80v.\+'

set columns=120
set lines=42
"color sashaDark
