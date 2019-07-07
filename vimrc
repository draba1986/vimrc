set nocompatible " 关闭 vi 兼容模式
set mouse=a
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'christoomey/vim-run-interactive'
Bundle 'gmarik/Vundle.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-syntastic/syntastic'
Bundle 'vim-scripts/ctags.vim'
Bundle "scrooloose/nerdtree"
Bundle "msanders/snipmate.vim"
Bundle "altercation/vim-colors-solarized"
Bundle 'majutsushi/tagbar'
Bundle 'danro/rename.vim'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'vim-scripts/tComment'
Bundle "Lokaltog/vim-powerline"
Bundle "jelera/vim-javascript-syntax"
Bundle "othree/html5.vim"
Bundle "Lokaltog/vim-easymotion"
Bundle "ycm-core/YouCompleteMe"


call vundle#end()
filetype plugin indent on

" Leader
let mapleader = ","
set history=400
syntax on " 自己主动语法高亮

let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized"  设定配色方案

set number " 显示行号
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4 " 使得按退格键时能够一次删掉 4 个空格
set tabstop=4 " 设定 tab 长度为 4
set expandtab
set nobackup " 覆盖文件时不备份
set noswapfile " 不产生swap文件
"set autochdir " 自己主动切换当前文件夹为当前文件所在的文件夹
set list listchars=tab:»·,trail:·
set textwidth=160
set colorcolumn=+1
set matchpairs+=<:>

" Highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

filetype plugin indent on " 开启插件
set ignorecase smartcase " 搜索时忽略大写和小写，但在有一个或以上大写字母时仍保持对大写和小写敏感
set nowrapscan " 禁止在搜索到文件两端时又一次搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃取代呼叫
set t_vb= " 置空错误铃声的终端代码
" set showmatch " 插入括号时。短暂地跳转到匹配的相应括号
" set matchtime=2 " 短暂跳转到匹配括号的时间
set magic " 设置魔术
set hidden " 同意在有未保存的改动时切换缓冲区，此时的改动由 vim 负责保存
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单条
set smartindent " 开启新行时使用智能自己主动缩进
set backspace=indent,eol,start
" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=2 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\%<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
" 设置在状态行显示的信息
set foldenable " 開始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为
" set foldclose=all " 设置为自己主动关闭折叠 
" nnoremap <space> @=((foldclosed(line('.')) < 0) ?  'zc' : 'zo')<CR>
" 用空格键来开关折叠
function! MySys()
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

" 用户文件夹变量$VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif

" 设定doc文档文件夹
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持
if has("win32")
    set guifont=Inconsolata:h12:cANSI
endif

" 配置多语言环境
if has("multi_byte")
    " UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk

    if v:lang =~?'^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
    
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>


" Tab操作快捷方式!
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

"关于tab的快捷键
" map tn :tabnext<cr>
" map tp :tabprevious<cr>
" map td :tabnew .<cr>
" map te :tabedit
" map tc :tabclose<cr>

" 快捷键代替esc
imap <D-k> <ESC>
imap <A-k> <ESC>
vmap <D-k> <ESC>
vmap <A-k> <ESC>
cmap <D-k> <ESC>:w<CR>
cmap <A-k> <ESC>:w<CR>
map <D-k> <ESC>:w<CR>
map <A-k> <ESC>:w<CR>
" 切换窗口
nmap <Leader>j <C-w>j
nmap <Leader>l <C-w>l
nmap <Leader>h <C-w>h
nmap <Leader>k <C-w>k
" 检索文件名
nmap <Leader>f <C-p>
" 检索文件内容
nmap <Leader>s :vimgrep<space>//gj<space>**
" 切换buffer
nmap <Leader>p :bp<CR>
nmap <Leader>n :bn<CR>
" 打开控制台，在右侧边
nnoremap <Leader>t :vertical terminal<CR>
" 执行外部命令
nnoremap <Leader>r :RunInInteractiveShell<space>
" 运行外部命令prettier格式化
nnoremap <Leader>F :RunInInteractiveShell<space>prettier<space>%<CR>

" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
" map <C-x>l <ESC>:cl<CR>
" map <C-x>n <ESC>:cn<CR>
" map <C-x>p <ESC>:cp<CR>
" map <C-x>c <ESC>:cc<CR>

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F9> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F10> :TagbarToggle<CR>

" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

