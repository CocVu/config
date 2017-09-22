" line `. last edit `` last jump `^ insertmod
let filename=expand('%:r')
let mapleader="\<Space>"
nnoremap K i<CR><Esc>
nnoremap <c-l> gg=G `. 
inoremap <c-l> <Esc> gg=G `^ <CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>\| :TableModeToggle<CR>
noremap  <Leader>l :tabn<CR> 
noremap  <Leader>h :tabp<CR>
noremap  <Leader>o :tabnew<CR>
noremap  <Leader>x :tabclose<CR>
map <Leader> <Plug>(easymotion-prefix)
set number 
set relativenumber 
set nocompatible
set encoding=utf-8
highlight Pmenu ctermfg=15 ctermbg=4 guifg=#ffffff guibg=#0a0468 "highlight ycm
filetype off
" +------------+
" | POWER LINE |
" +============+
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/   
set laststatus=2                                                            
set t_Co=256
" +--------+
" | PLUGIN |
" +========+

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-pathogen'
Plugin 'python-mode/python-mode' 	" python
Plugin 'tpope/vim-surround'		" 'Hello world!' cs'<q> <q>Hello world!</q> 
Plugin 'VundleVim/Vundle.vim'		"set Plugin
Plugin 'Lokaltog/powerline' 		" power line mode
Plugin 'jiangmiao/auto-pairs'           "auto closing pair brak
Plugin 'SirVer/ultisnips'		"snippet 
Plugin 'jrozner/vim-antlr'              "antlr
Plugin 'Valloric/YouCompleteMe' 	"auto complete
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'easymotion/vim-easymotion' 	"easy motion Leader Leader j or k
Plugin 'scrooloose/nerdcommenter' 	"commnent Leader cc cu ma md
Plugin 'artur-shaik/vim-javacomplete2'  "java complete
Plugin 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'} 	" || && Leader |
call vundle#end()            
filetype plugin indent on    
call pathogen#infect()
call pathogen#helptags()
syntax enable

" +-------+
" | TABLE |
" +=======+
let g:table_mode_corner='|'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" +---------------+
" | AUTO COMPLETE |
" +===============+
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" +------------+
" | SUPPER TAB |
" +============+
au FileType java setlocal omnifunc=javacomplete#Complete
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" +---------+
" | COMMENT |
" +=========+
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" +--------+
" | BUFFER |
" +========+
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

" +-------+
" | SPLIT |
" +=======+
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" +---------+
" | COMPILE |
" +=========+
au Filetype python  nnoremap <F5> :w <CR> :!clear && python  % <CR>
au Filetype python  inoremap <F5> <Esc>:w <CR> :!clear && python  % <CR>
au Filetype c,cpp  nnoremap <F5>  :w <CR> :call CompileCpp() <CR>
au Filetype c,cpp  inoremap <F5>  <Esc>:w <CR> :call CompileCpp() <CR>
au Filetype c,cpp  nnoremap <F10>  :w <CR> :!clear && g++  % -o %:r && ./%:r <CR>
au Filetype c,cpp  inoremap <F10>  <Esc>:w <CR> :!clear && g++  % -o %:r && ./%:r <CR>
au Filetype java  nnoremap <F5>  :w <CR>:call CompileJava() <CR>
au Filetype java  inoremap <F5>  <Esc>:w <CR>:call CompileJava() <CR>
au Filetype java  nnoremap <F10>  :w <CR> :!clear && javac %  && java  %:r <CR>
au Filetype java  inoremap <F10> <Esc> :w <CR> :!clear && javac %  && java  %:r <CR>
au Filetype txt  nnoremap <F5> :e! <CR>
au Filetype txt  inoremap <F5> <Esc> :e! <CR>
au Filetype scala  nnoremap <F5>  :!clear && scalac %  && scala  %:r <CR>
function! CompileCpp()
	if !empty(glob("input"))
		:!clear && g++  % -o %:r && ./%:r<input
	else
		:!clear && g++  % -o %:r && ./%:r
	endif
endfunction
function! CompileJava()
	if !empty(glob("input"))
		:!clear && javac %  && java  %:r < input
	else
		:!clear && javac %  && java  %:r 
	endif
endfunction

" +---------+
" | COMMENT |
" +=========+
" Commenting blocks of code.
" autocmd FileType c,cppva,scala let b:comment_leader = '// '
" autocmd FileType sh,ruby,python   let b:comment_leader = '# '
" autocmd FileType conf,fstab       let b:comment_leader = '# '
" autocmd FileType tex              let b:comment_leader = '% '
" autocmd FileType mail             let b:comment_leader = '> '
" autocmd FileType vim              let b:comment_leader = '" '
" noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>'"'"

" +-------------+
" | EASY MOTION |
" +=============+
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>f <Plug>(easymotion-bd-w)
nmap <Leader>f <Plug>(easymotion-overwin-w)
set mouse+=a
