" ***************************************
" ***  Define plugins
" ***************************************

call plug#begin("~/.vim/plugged")

Plug 'fcpg/vim-fahrenheit'
Plug 'tpope/vim-sensible'
Plug 'vimwiki/vimwiki'
Plug 'wincent/terminus'

call plug#end()



" ***************************************
" ***  Behavior
" ***************************************

" Put swap files and backups in . only as a last resort
set directory-=.
set directory+=.
set backupdir-=.
set backupdir+=.



" ***************************************
" ***  Navigation
" ***************************************

" Pressing up in a long line gets you to the above line 'in the screen',
" but if you precede it with a count, you get the old behavior
" and if the count > 5, we'll also add it to the jump list so we can do C-O and C-I
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'



" ***************************************
" ***  Appearance
" ***************************************

" Make it look purty
colorscheme fahrenheit
set background=dark
" Show line-numbers
set number
" Don't wrap lines in the middle of a word. That's not cool.
set linebreak



" ***************************************
" ***  Plugin configuration
" ***************************************

" VimWiki
nmap <F12> :VimwikiIndex<CR>
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.wiki'}]
let g:vimwiki_folding = 'expr'
augroup VimWiki
    autocmd!
    autocmd FileType vimwiki setlocal foldexpr=StackedMarkdownFolds()
augroup END



" ***************************************
" ***  VIM itself!
" ***************************************

" Open .vimrc.
:command! EditVimrc e ~/.vimrc
" Reload .vimrc.
:command! ReloadVimrc source ~/.vimrc
" Reload .vimrc whenever it's written.
augroup AutoSourceVimrc
    autocmd!
    autocmd BufWritePost ~/.vimrc ReloadVimrc
augroup END

