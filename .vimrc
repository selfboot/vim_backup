syntax on                       " support syntax highlight
set showmatch                   " jump to the matching bracket
set ignorecase smartcase        " the case of normal letters is ignored
set showmode                    " show the mode
set history=1000
set showcmd
set mouse=a 			    	" use mouse
set number                      " display line number
set hls                         " highlight the words match the search pattern
set nocompatible                " shutdown the vi compatibility mode
set incsearch 			     	" show the pattern as it was typed so far
set foldmethod=syntax           " folds are created manually
set pastetoggle=<F2>            " toggle the paste mode with <F2>
set iskeyword+=_,$,@,%,#,-      " set the keywords
set confirm                     " prompt when existing from an unsaved file
set wrap linebreak nolist       " wrap at a character in the breakat option
set textwidth=0 		     	" maximum width in a line
set spelllang=en                " spell checking
set fileencodings=ucs-bom,utf-8,cp936,gb18030,default,latin1

" Default Indentation
set autoindent                  " indent automatically
set tabstop=4                   " number of spaces a <Tab> counts for
set shiftwidth=4 		     	" number of spaces each step of (auto)indent counts for
set softtabstop=4               " Number of spaces that a <Tab> counts for while using <BS>.
set expandtab

" set hlsearch 			     	" enable highlight(default)
" set nohlsearch                " cancel highlight
" set wrap 			     	    " enables wrap(default)
" set nowrap                    " cancel wrap
" set tags=~/AdvanPro/tags      " tags directory
" set helplang=cn               " Chinese help document
" set helplang=en

filetype on      		     	" enables filetype detection
filetype plugin on              " enables filetype plugin
filetype indent on 		     	" enables filetype indent
color desert                    " color theme

let g:html_number_lines = 0     "buffer text is displayed in the generated HTML without line numbering

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
" Bundle "Valloric/YouCompleteMe"
Bundle "davidhalter/jedi"
Bundle "bling/vim-airline"
" All of your Plugins must be added before the following line
call vundle#end()            " required


" Brackets auto-complete
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i

" for ycm
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_error_symbol = '>>'
" let g:ycm_warning_symbol = '>*'
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" for syntastic
let g:syntastic_python_flake8_args='--ignore=E501'

" for python
autocmd Filetype python setlocal foldmethod=indent
autocmd Filetype python setlocal textwidth=79
autocmd BufNewFile,BufRead *.py nmap  <F10> :!chmod +x %<CR>
autocmd BufNewFile *.py 0r ~/.vim/templates/header.py | $
set foldlevel=99        		                    " don't fold the code by default
" pydiction plugin required
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'

" for bash shell
autocmd BufNewFile *.sh 0r ~/.vim/templates/header.sh | $

" conf for vim-airline
set laststatus=2              " Always show the statusline

" conf for NERDTree
nmap <C-t> :NERDTreeToggle<CR>

" for conf that diff in different system
if has("unix")
        let s:uname = system("uname")
        " for mac
        if s:uname == "Darwin\n"
                set clipboard=unnamed
                autocmd! BufNewFile,BufRead *.c,*.h,*.cpp nmap <F12> :!indent %<CR>
        endif

        " for linux
        if s:uname == "Linux\n"
                autocmd! BufNewFile,BufRead *.c,*.h,*.cpp nmap <F12> :!indent -kr -i8 %<CR>
                set clipboard=unnamedplus 	" yank to system clipboard
                set path=.,/usr/include 	" goto file path
        endif
endif

if has("gui_running")
        set cursorline                          " highlight current line
        " Under Mac
        if has("gui_macvim")
                "set transparency=20            " transparency
                set guifont=Monaco:h16          " default font monaco
                "set guifontwide=Hiragino\ Sans\ GB\ W3:h16
                "set guifont=Menlo:h16
                colorscheme desert              " need desert color file
                "colorscheme Tomorrow-Night
                map <D-1> 1gt
                map <D-2> 2gt
                map <D-3> 3gt
                map <D-4> 4gt
                map <D-5> 5gt
                map <D-6> 6gt
                map <D-7> 7gt
                map <D-8> 8gt
                map <D-9> 9gt
                map <D-0> :tablast<CR>
        endif
endif

" conf for tagbar: list the tags(function, class, variable, etc)
" nmap <F3> :TagbarToggle<CR>
" let g:tagbar_ctags_bin='/usr/bin/ctags' 
" let g:tagbar_width = 40        " set tagbar's width 40
" let g:tagbar_right = 1         " show the tagbar in the right
" let g:tagbar_left = 1
