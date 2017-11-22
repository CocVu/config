let $vimhome=fnamemodify(resolve(expand("~/.vimrc")), ':p:h')
let $vundle=$vimhome."/bundle/Vundle.vim"

set nocompatible
let mapleader="\<Space>"
nnoremap <c-l> gg=G `.
inoremap <c-l> <Esc> gg=G `^ <CR>
nnoremap <C-n> :NERDTreeToggle<CR>
noremap  <C-c> "+y
noremap  <Leader>y "+y
map <C-V>               "+gP
map <S-Insert>          "+gP
cmap <C-V>              <C-R>+
cmap <S-Insert>         <C-R>+
map <Leader> <Plug>(easymotion-prefix)
nnoremap <Leader>q q 
"record key leader q disable record q
nnoremap q :w <CR>
inoremap <B-q> <Esc>:w <CR>
vnoremap < <gv                              " move block
vnoremap > >gv                              " move block
noremap  <Leader>e :wq<CR>
noremap  <Leader>E :wqa!<CR>
" +--------+
" | VUNDLE |
" +--------+
filetype off
set rtp+=$vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required
"-------------------=== Code/Project navigation ===-------------
Plugin 'scrooloose/nerdtree'                " Project and file navigation
Plugin 'majutsushi/tagbar'                  " Class/module browser
Plugin 'kien/ctrlp.vim'                     " Fast transitions on project files
"-------------------=== Comment ===-------------------------------
Plugin 'scrooloose/nerdcommenter' 	        "commnent Leader cc cu ma md
Plugin 'easymotion/vim-easymotion' 	        "easy motion Leader Leader j or k
"-------------------=== Snippets support ===--------------------
Plugin 'garbas/vim-snipmate'                " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
Plugin 'tomtom/tlib_vim'                    " dependencies #2
Plugin 'honza/vim-snippets'                 " snippets repo
"-------------------=== Languages support ===-------------------
Plugin 'tpope/vim-commentary'               " Comment stuff out
Plugin 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
Plugin 'Rykka/riv.vim'                      " ReStructuredText plugin
Plugin 'Valloric/YouCompleteMe'             " Autocomplete plugin
"-------------------=== Python  ===-----------------------------
Plugin 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plugin 'scrooloose/syntastic'               " Syntax checking plugin for Vim
"-------------------=== Other ===-------------------------------
Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
Plugin 'rosenfeld/conque-term'              " Consoles as buffers
Plugin 'tpope/vim-surround'                 " Parentheses, brackets
Plugin 'flazz/vim-colorschemes'             " Colorschemes
Plugin 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'} "|| && Leader |
Plugin 'jiangmiao/auto-pairs'               "auto closing pair brak

call vundle#end()                           " required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme wombat256mod                    " set color scheme
set ruler
set ttyfast                                 " terminal acceleration
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code
set cursorline                              " shows line under the cursor's line
set enc=utf-8	                            " utf-8 by default
set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files
set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?
set scrolloff=10                            " let 10 lines before/after cursor during scroll
set clipboard=unnamed                       " use system clipboard
set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

" Additional mappings for Esc (useful for MacBook with touch bar)
inoremap jj <Esc>
inoremap jk <Esc>

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
"autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose
" +----------+
" | NERDTree |
" +----------+
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nnoremap <C-n> :NERDTreeToggle<CR>
" +---------+
" | SNIPPET |
" +---------+
let g:snippets_dir='~/.vim/vim-snippets/snippets'
"=====================================================
"" Riv.vim settings
"=====================================================
let g:riv_disable_folding=1
" +--------+
" | PYTHON |
" +--------+
autocmd BufEnter {window_name_list} :wincmd L
autocmd BufEnter __run__,__doc__ :wincmd L
" python executables for different plugins
let g:pymode_python='python'
let g:syntastic_python_python_exec='python'
" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0
" documentation
let g:pymode_doc=0
let g:pymode_doc_key='M'
" lints
let g:pymode_lint=0
" virtualenv
let g:pymode_virtualenv=1
" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'
" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all
" +--------+
" | BUFFER |
" +--------+
au BufNewFile,BufRead *.py,*.c,*.cpp,*.scala,*.java,*.java
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run_bind='<F5>'
let g:pymode_run_bind='<leader>r'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

" YouCompleteMe
set completeopt-=preview

let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>
" +-------------+
" | EASY MOTION |
" +-------------+
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap  <Leader>f <Plug>(easymotion-bd-w)
map <Leader>f <Plug>(easymotion-overwin-w)
" +---------+
" | COMMENT |
" +---------+
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" +-------+
" | TABLE |
" +-------+
nnoremap <Leader>\| :TableModeToggle<CR>
let g:table_mode_corner='|'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='-' 
nnoremap K i<CR><Esc>
