set nu
syntax on
set expandtab
set softtabstop=4
set helplang=cn
set shiftwidth=4
filetype on

set shortmess=atI " 启动不显示乌干达
set ruler
colorscheme torte

set encoding=utf-8
set fileencoding=utf-8

set completeopt=preview,menu
set completeopt=longest,menu

filetype plugin on
set nobackup
set autowrite
set magic
set nocompatible

set noeb
set autoindent
" https://blog.csdn.net/freeking101/article/details/62037015
set softtabstop=4
set shiftwidth=4

set smarttab
set backspace=2

" set mouse=a

set showmatch
set matchtime=1


"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on


set autoread


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\#!/bin/bash")
        call append(line(".")+1, "")
    endif

    if &filetype == 'python'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# coding: utf-8")
        call append(line(".")+1, "\#!/usr/bin/python")
    endif

    if &filetype == 'sh' || &filetype == 'python'
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author: buptxiaomiao")
        call append(line(".")+4, "\# mail: buptwjh@outlook.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%c"))
        call append(line(".")+6, "\#########################################################################")
    endif

    if &filetype == 'java'
        call setline(1, "/*------------------------------------------------------------------------")
        call append(line("."), "-   File Name: ".expand("%"))
        call append(line(".")+1, "-    Author: buptxiaomiao")
        call append(line(".")+2, "-    Mail: buptwjh@outlook.com ")
        call append(line(".")+3, "-    Created Time: ".strftime("%c"))
        call append(line(".")+4, "------------------------------------------------------------------------*/")
        call append(line(".")+5, "")
    endif

        
    if &filetype == 'cpp' || &filetype == 'c'
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: buptxiaomiao")
        call append(line(".")+2, "    > Mail: buptwjh@outlook.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif

    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal GG
endfunc

