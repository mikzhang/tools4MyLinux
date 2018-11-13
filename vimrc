" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.



" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
" NOTE: on MacOs, sets 'nocompatible'.
set compatible

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


filetype off "required for Vundle



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""
"vim插件之-代码篇
"""""""""""
" 拥有python几乎所有IDE的功能，吐血推荐 ，杀手级python插件
Plugin 'klen/python-mode'
" 虚拟环境python支持
"Plugin 'mcantrell/vim-virtualenv'
" js支持
Plugin 'pangloss/vim-javascript'
" 书写html和css，前端支持
Plugin 'mattn/emmet-vim'
" 支持各种流行编程语言的语法检测
Plugin 'scrooloose/syntastic'
" 支持大纲浏览
" ref https://github.com/majutsushi/tagbar
" Dependencies: sudo apt install exuberant-ctags
Plugin 'majutsushi/tagbar'
" git支持，直接在vim中执行git命令。一个特别方便的命令就是:Gblame，可以看到每一行代码是谁在啥时候提交的
Plugin 'tpope/vim-fugitive'
" 支持c/c++/python/go等流行编程语言的代码补全
"Plugin 'Valloric/YouCompleteMe'
" 快速注释，支持几乎所有编程语言
Plugin 'scrooloose/nerdcommenter'
" No-BS Python code folding for Vim 
" ref https://github.com/tmhedberg/SimpylFold
Plugin 'tmhedberg/SimpylFold'


"""""""""""
"vim插件之-移动篇
"""""""""""
"  快速移动插件, ‘,,w’可以在单词上出现前缀，然后快速跳转
Plugin 'easymotion/vim-easymotion'


"""""""""""
"vim插件之-文件浏览
"""""""""""
" 在vim里文件树浏览
Plugin 'scrooloose/nerdtree'
" 快速文件搜索和跳转，支持mru搜索，基本就可以放弃文件树了
Plugin  'kien/ctrlp.vim'


"""""""""""
"vim插件之-外观篇
"""""""""""
" 缩进线条，可以set cursorline加上水平线条
Plugin 'yggdroot/indentline'
" 和 Plugin ‘vim-airline/vim-airline, 底下的文件信息提示行,彩虹效果
Plugin 'bling/vim-airline'
" 彩虹括号，让嵌套括号容易分辨
"Plugin 'kien/rainbowparentheses.vim'

" ref: https://github.com/junegunn/vim-easy-align
Plugin 'junegunn/vim-easy-align'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line





" map for plugin tagbar
nmap <F8> :TagbarToggle<CR>

" open NerdTree
nmap <C-n> :NERDTreeToggle<CR>

" 定义快捷键的前缀，即<Leader>
let mapleader=";"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"还想隐藏.pyc文件？那么再添加下面这行代码吧：
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" 希望看到折叠代码的文档字符串
let g:SimpylFold_docstring_preview=1
" Fold imports
let g:SimpylFold_fold_import=1

" for airline
let g:airline#extensions#tabline#enabled = 1

" 缩进线
let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_color_term = 239
"let g:indentLine_char = '┆'
"let g:indentLine_char = '│'
let g:indentLine_char = '|'



"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>







" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Following added by ran
" show line number
set number
" highlight current line and column
set cursorline
"set cursorcolumn
" highlight search result
set hlsearch
"代码缩进
" 自适应不同语言的智能缩进
"filetype indent on
" 自动缩进  (应该和上一句一样功能<ran网上查的>)
"autocmd FileType c,java,javascript,html,jsp set autoindent
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" no backup
set nobackup
set noswapfile



" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

