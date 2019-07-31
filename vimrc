" 步骤
" 1.git 安装Vundle
" 2.按照配置运行PluginInstal安装插件
" 4.安装ctags


function! Install()
endfunction

function! InstallInMac()
  call Install()
  brew install fzf
  brew install ripgrep
endfunction

function! InstallInUbuntu()
  call Install()
  sudo apt install fzf
endfunction

" 关闭 vi 兼容模式
set nocompatible

" Leader
let mapleader=" "
"初始安装插件
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/bin/fzf
set rtp+=~/.fzf
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'posva/vim-vue'
Plugin 'itchyny/calendar.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'janko/vim-test'
Plugin 'pangloss/vim-javascript'
Plugin 'rust-lang/rust.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'danro/rename.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'vim-scripts/tComment'
Plugin 'skywind3000/asyncrun.vim'
" 配色方案
Plugin 'altercation/vim-colors-solarized'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()

" 允许使用鼠标
set mouse=a

" 颜色方案
set t_Co=256
set background=dark
colorscheme solarized"  设定配色方案

" 备份和历史
set history=400
set nobackup " 覆盖文件时不备份
set noswapfile " 不产生swap文件
set autoread " 打开文件监视。如果在编辑过程中文件发生外部改变（比如被别的编辑器编辑了），就会发出提示。

syntax on " 自己主动语法高亮
filetype plugin indent on " 开启插件

" 基本设置
set number " 显示行号
set ruler " 打开状态栏标尺
set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单条
set list
set listchars=tab:>-,trail:-
set scrolloff=5
set sidescrolloff=15
set matchpairs+=<:>
set matchtime=2 " 短暂跳转到匹配括号的时间
set nospell
set backspace=indent,eol,start
set cmdheight=2 " 设定命令行的行数为
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)

" 配置多语言环境
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk
set ambiwidth=double

" 根据编程语言要求调整
set shiftwidth=2 " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=2 " 使得按退格键时能够一次删掉 4 个空格
set tabstop=2 " 设定 tab 长度为 4
set expandtab
"set autochdir " 自己主动切换当前文件夹为当前文件所在的文件夹
set textwidth=160
set colorcolumn=+1
set smartindent " 开启新行时使用智能自己主动缩进

" Highlight current line
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn

set ignorecase smartcase " 搜索时忽略大写和小写，但在有一个或以上大写字母时仍保持对大写和小写敏感
set wrapscan " 禁止在搜索到文件两端时又一次搜索
set incsearch " 输入搜索内容时就显示搜索结果
set hlsearch " 搜索时高亮显示被找到的文本
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃取代呼叫
set t_vb= " 置空错误铃声的终端代码
set showmatch " 插入括号时。短暂地跳转到匹配的相应括号
set magic " 设置魔术
set hidden " 同意在有未保存的改动时切换缓冲区，此时的改动由 vim 负责保存
"
"set foldenable " 開始折叠
"set foldmethod=syntax " 设置语法折叠
"set foldcolumn=0 " 设置折叠区域的宽度
"setlocal foldlevel=1 " 设置折叠层数为
"set foldclose=all " 设置为自己主动关闭折叠 

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
    set guifont=Hack:h13
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
    set guifont=Hack\ 13
endif

" 设定doc文档文件夹
let helptags=$VIMFILES.'/doc'

" 设置字体 以及中文支持

if has("win32")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" 快捷键代替esc
inoremap <silent><C-s> <ESC>
inoremap <silent><C-k> <ESC>
inoremap <silent><D-k> <ESC>
inoremap <silent><A-k> <ESC>
vnoremap <silent><C-s> <ESC>
vnoremap <silent><C-k> <ESC>
vnoremap <silent><D-k> <ESC>
vnoremap <silent><A-k> <ESC>
cnoremap <silent><C-s> <ESC>:w<CR>
cnoremap <silent><C-k> <ESC>:w<CR>
cnoremap <silent><D-k> <ESC>:w<CR>
cnoremap <silent><A-k> <ESC>:w<CR>
noremap <silent><D-s> <ESC>:w<CR>
noremap <silent><D-k> <ESC>:w<CR>
noremap <silent><C-k> <ESC>:w<CR>
noremap <silent><A-k> <ESC>:w<CR>

let g:UltiSnipsExpandTrigger="<D-j>"
let g:UltiSnipsJumpForwardTrigger="<D-i>"
let g:UltiSnipsJumpBackwardTrigger="<D-u>"
" let g:UltiSnipsExpandTrigger="<A-j>"
" let g:UltiSnipsJumpForwardTrigger="<A-i>"
" let g:UltiSnipsJumpBackwardTrigger="<A-u>"

" 使用Tab键补全
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()

function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" 切换窗口
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>k <C-w>k
" 切换buffer
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>d :bd<CR>
"关于tab的快捷键
nnoremap <Leader>t :tabnext<CR>

nnoremap <Leader>cc <ESC>:cclose<CR>
nnoremap <Leader>co <ESC>:copen<CR>

" 检索文件名
noremap <Leader>f :Files<CR>
" 检索文件内容
nnoremap <Leader>s :Rg<CR>
" 打开控制台，在右侧边
nnoremap <Leader>ter :vertical terminal<CR>
" 执行外部命令
nnoremap <Leader>r :AsyncRun<space>
" 运行外部命令prettier格式化
"
tnoremap <C-k> <C-w>
tnoremap <D-k> <C-w>
tnoremap <A-k> <C-w>

let test#strategy="vimterminal"

let g:user_emmet_leader_key='<D-y>'

let $FZF_DEFAULT_OPTS.=' --inline-info -i '
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_layout={ 'down': '~40%' }
let g:fzf_history_dir='~/.local/share/fzf-history'
let g:fzf_buffers_jump=1
let g:fzf_commands_expect='alt-enter,ctrl-x'
let g:fzf_commits_log_options='--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command='ctags -R'


command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --glob !node_modules/ --glob !.git/ --glob !yarn.lock --glob !package-lock.json --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

let g:solarized_termcolors=256
let g:solarized_termtrans=1

let g:asyncrun_open=1

let g:ale_linters_explicit=1
let g:ale_linter_aliases={
      \'jsx': ['css', 'javascript'],
      \'vue': ['vue', 'javascript']
      \}

let g:ale_linters={
      \'javascript': ['eslint', 'prettier'],
      \'jsx': ['eslint', 'stylelint'],
      \'vue': ['eslint', 'vls'],
      \'typescript': ['eslint', 'prettier']
      \}

let b:ale_fixers={
      \'javascript': ['prettier'],
      \'typescript': ['prettier']
      \}

let g:ale_lint_on_text_changed=0
let g:ale_fix_on_save=1
let g:ale_sign_column_always=1
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
let g:ale_open_list=1
let g:ale_keep_list_window_open=1
let g:ale_list_window_size=5

let g:airline#extensions#ale#enabled=1

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
"autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F9> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F10> :TagbarToggle<CR>

iab fcif 
      \if () {
      \<CR>}<Esc>k$3h

iab fcife 
      \if () {
      \<CR>} else {
      \<CR>}<Esc>2k$3h

iab fcelse 
      \if () {
      \<CR>} else {
      \<CR>}<Esc>2k$3h

iab fceif 
      \if () {
      \<CR>} else {
      \<CR>}<Esc>2k$3h

iab fcfor 
      \for (let i = 0; i < x.length; i++) {
      \<CR>}<Esc>k$6bh

iab sp 
      \()<Esc>h

iab spx 
      \();<Esc>2h

iab sb 
      \{}<Esc>h

iab ss 
      \[]<Esc>h

iab ssx 
      \[];<Esc>2h

iab ;; 
      \<Esc>$a;<Esc>h

iab tghtml 
      \<html></html><Esc>2b

iab tgbody 
      \<body></body><Esc>2b

iab tgdiv 
      \<div></div><Esc>2b

iab tgspan 
      \<span></span><Esc>2b

iab tgv 
      \{{}}<Esc>2h

iab tgclick 
      \@click=""<Esc>h

iab varc 
      \const a = ;<Esc>h

iab varl 
      \let a = ;<Esc>h

iab varcr 
      \const a = require('');<Esc>3h

iab rlodash 
      \const _ = require('lodash');<Esc>h

iab rexpress 
      \const express = require('express');<Esc>h

iab rjoi 
      \const joi = require('joi');<Esc>h

iab rpath 
      \const path = require('path');<Esc>h

iab rfs 
      \const fs = require('fs');<Esc>h

iab rmoment 
      \const moment = require('moment');<Esc>h

iab tyf 
      \() => {}<Esc>h

iab tyfunc 
      \function () {}<Esc>h

iab tyaf 
      \async () => {}<Esc>h

iab tyanf 
      \async () {
      \<CR>}<Esc>k$4hi

iab return 
      \return;<Esc>i

iab try 
      \try {
      \<CR>} catch (err) {
      \<CR>}<Esc>2k$h

iab tyclass 
      \class {
      \<CR>constructor () {
      \<CR>}
      \<CR>}<Esc>3k$2hi

iab tyclasse 
      \class a extends b {
      \<CR>constructor () {
      \<CR>super();
      \<CR>}
      \<CR>}<Esc>4k$3bh

iab tyinterface 
      \interface {
      \<CR>}<Esc>k2hi

iab clog 
      \console.log();<Esc>2h


