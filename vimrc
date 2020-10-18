" Vimrc Version 0.1.0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-plug'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-airline/vim-airline'
call plug#end()

filetype plugin on
syntax on

colorscheme default                                                 " use this colorscheme
set encoding=utf-8                                                  " set utf-8
set nocompatible                                                    " use vim defaults
set viminfo=                                                        " turn off logging while using vim
set ls=2                                                            " allways show status line
set ruler                                                           " show the cursor position all the time
set nobackup                                                        " do not keep a backup file
set t_vb=                                                           " no visual bell & flash
set number                                                          " show line numbers
set title                                                           " show title in console title bar
set ttyfast                                                         " smoother changes
set showcmd                                                         " display incomplete comands
set showmatch                                                       " show matching bracket
set nowrap                                                          " don't wrap lines
set wrapscan                                                        " wrap the scan around the document
set list                                                            " show the end of the line as $
set lcs=nbsp:¬,eol:$,tab:>-,extends:»,precedes:«,trail:·            " set tabs and stops
set autoindent                                                      " set autoindent on
set cindent                                                         " indenting source code
set smartindent                                                     " set smartindent on
set tabstop=2                                                       " show existing tab with 2 spaces width
set softtabstop=2                                                   " the Tab key indent by 2 spaces
set shiftwidth=2                                                    " when indenting with '>', use 2 spaces width
set expandtab                                                       " converts tabs to white spaces
set nofoldenable                                                    " no folding
set path +=**                                                       " search down into subfolder. tab completion
set wildmenu                                                        " display all matching files when we tab complete
set wildignore +=**/node_modules/**                                 " ignore node_modules
set hlsearch                                                        " highlight the search
set ignorecase                                                      " search ignoring case
set incsearch                                                       " incremental search
set diffopt=filler,iwhite                                           " ignore all whitespace and sync
set magic                                                           " set magic on, for regular expressions
set textwidth=80                                                    " set text width to 80
call matchadd('ColorColumn', '\%80v.', 100)                         " make the 80st column stand out

" Only do this part when compiled with support for autocommands
if has("autocmd")
    " Enable file type detection
    filetype on

    " Customisations for c, javascript, python
    autocmd FileType c setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType javascript setlocal ts=4 sts=0 sw=4 noexpandtab
    autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab

    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Word wrap without line breaks only when editing text, not programming code
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0

" set leader key to thespace key
let mapleader = "\<Space>"

" Change between number, nonumber and relativenumber
nmap <silent> <leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Open / close corresponding .pdf preview
noremap <Leader>v :! evince %<.pdf 2>&1 >/dev/null &<CR><CR>
noremap <Leader>q :! killall evince<CR><CR>

" Assignment of the F - keys
" F2 Start NERDTree
map <F2> :NERDTree <CR>

" F3 Convert tabstops to spaces
map <F3> :retab <CR>

" F4 Avoid aliasing after copy and paste
map <F4> :set paste <CR>

" F5 html-encode
function! HtmlEscape()
  silent s/ö/\&ouml;/eg
  silent s/ä/\&auml;/eg
  silent s/ü/\&uuml;/eg
  silent s/Ö/\&Ouml;/eg
  silent s/Ä/\&Auml;/eg
  silent s/Ü/\&Uuml;/eg
  silent s/ß/\&szlig;/eg
endfunction
map <silent> <F5> :call HtmlEscape()<CR>

" F6 Spell checker
" Install in the directory /usr/share/vim/vim/79/spell
let g:myLang = 0
let g:myLangList = ["OFF", "German", "English"]
function! ChangeSpellLang()
    if g:myLang == 0 | set nospell | endif
    if g:myLang == 1 | set spell spelllang=de_de | endif
    if g:myLang == 2 | set spell spelllang=en_us | endif
    echo "language:" g:myLangList[g:myLang]
    let g:myLang = g:myLang + 1
    if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
endfunction
map <silent> <F6> :call ChangeSpellLang()<CR>

" F7 Clean up the latex project
map <silent> <F7> :!rm ./*/*.aux *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.lof *.log *.lol *.lot *.run.xml *.toc *.sum *.synctex.gz *.out *.nav<CR>

" F8 Tagbar
map <F8> :TagbarToggle <CR>
