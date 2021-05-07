call plug#begin('~/.vim/plugged')
" Shorthand notation for plugin
Plug 'fatih/vim-go',{'for':'go'}
Plug 'ycm-core/YouCompleteMe', {'do': './install.py --go-completer'}
Plug 'dgryski/vim-godef'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/LeaderF', {'do': './install.py'}
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'vim-scripts/indentpython'
Plug 'rizzatti/dash.vim'
call plug#end()


syntax on
let python_highlight_all=1
set encoding=utf-8

set nocompatible " 关闭兼容模式, vim是vi的升级版, 设置compatible会让vim更多的兼容vi, 导致很多高级功能不可用
set backspace=indent,eol,start " indent 设置删除缩进，eol 删除空白字符(\n, \t,\r), start 能删除自插入模式之前的文字
" vimrc 保存后立即生效
" autocmd	BufWritePost $MYVIMRC source $MYVIMRC

" vim config
set nu
set showmatch " 显示括号匹配
set cursorline " 突出显示当前行
" set cursorcolumn " 突出显示当前列
set ignorecase " 查找大小写不敏感



set tabstop=4 " 设置Tab长度为4
set shiftwidth=4 " 设置自动缩进长度为4
set autoindent " 继承前一行的缩进方式, 适用于多行注释

" au InsertLeave *.go write " 离开文件时自动保存

" 0 新开一个window 1: 水平切割窗口 2: 新开一个tab 3: 垂直切割一个窗口
let g:godef_split=2
" 当跳转的函数在统一文件内,则不新开窗口
let g:godef_same_file_in_same_window=1
" airline 设置tab标签
let g:airline#extensions#tabline#enabled=1
" 设置powerline字体
let g:airline_powerline_fonts=1
" 设置leader键
let mapleader=","
" 缓冲区列表
set wildmenu wildmode=full
set wildchar=<Tab> wildcharm=<C-z>
" 缓冲区快捷键
noremap <C-z> :b <C-z>

let g:go_fmt_command="goimports"


" 快捷键映射
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" NerdTree
noremap <C-n> :NERDTreeToggle<CR>
nmap <C-c> :TagbarToggle<CR>
noremap <C-p> :LeaderfFile<CR>
noremap <C-r> :Leaderf rg<CR>


" tab 切换
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 :tablast<CR>


autocmd FileType go nnoremap  <leader>r <Plug>(go-run)


" vim-go map
nnoremap <Leader>m :GoReferrers<CR>
"nnoremap <C-m> :GoReferrers<CR>


"设置vim打开自启动nerdtree
" autocmd vimenter * NERDTree
" 设置当页面上只有nerdTree时关闭页面
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif




let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" 不设置备份文件
set nobackup
set undodir=~/.vim/undodir

if !isdirectory(&undodir)
	call mkdir(&undodir, 'p', 0700)
endif


" PEP8 风格的缩进
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" 标示不必要的空白字符
" au BufNewFile,BufRead *.py,*.pyw match BadWhiteSpace /\s\+$/
"


" 设置代码折叠
" manual 
" indent
" expr
" syntax
" diff
" marker
set foldmethod=indent

