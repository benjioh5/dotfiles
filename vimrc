" set color scheme
set t_Co=256
set term=xterm-256color
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 2
colorscheme badwolf

" set status line
set laststatus=2

" to avoid collision with vundle and fish shell
set shell=/bin/bash

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check file encoding                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	set fileencodings=ucs-bom,utf-8,latin1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Windows                                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32") || has("win16")
   " Windows OS key mapping
	map <F2> :w!<CR>
	map <F5> :! gcc % -o %<.exe<CR>
	map <C-F5> :! g++ % -o %<.exe<CR>
   " Windows vim RUNTIME setting
	map <C-F10> :! ./%<CR>
   source $VIMRUNTIME/vimrc_example.vim
   source $VIMRUNTIME/mswin.vim
   behave mswin " Ctrl-C Ctrl-V enable at gvim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Setting                                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set formatoptions-=r
filetype off "required (??)

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'isRuslan/vim-es6'
Plugin 'ap/vim-css-color'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'AutoComplPop'
"Plugin 'valloric/youcompleteme'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'The-NERD-Tree'
"Plugin 'scrooloose/syntastic'
Plugin 'hallison/vim-markdown'
Plugin 'dag/vim-fish'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'asmx86_64'
Plugin 'mattn/vim-particle'
Plugin 'metakirby5/codi.vim'
Plugin 'shirk/vim-gas'
call vundle#end()            " required
filetype plugin indent on    " required
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Help                                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins;
"                     append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"                     append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Congifure                                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-gas setting (not yet added)

"vim-css-color setting
let g:cssColorVimDoNotMessMyUpdatetime = 1

"youcompleteteme setting (tmp)
let g:ycm_confirm_extra_conf = 0

"vim-indent-guides setting
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

" no more use
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" syntax on
syntax on

"for iamroot (temporary)
au BufRead,BufNewFile *.asm set filetype=asmx86_64


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Congifure                                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" for asm syntax highlighting
set syntax=asmx86_64

"line number
set nu
set rnu

set nocompatible " Vim 디폴트 기능들을 사용함 "

" auto fill
set wildmenu

" backup
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.

set autoread

set mouse+=a
set scrolloff=5
set backspace=2 " 삽입 모드에서 백스페이스를 계속 허용 "

" indent
set autoindent " 자동 들여쓰기 "
set cindent " C 언어 자동 들여쓰기 "
set smartindent " 역시 자동 들여쓰기 "

set wrap " 자동 줄바꿈 안 함
"set textwidth=79 80번째 칸을 넘어가면 자동으로 줄 바꿈 "
"set formatoptions=qrn1
set colorcolumn=80 " 80번쨰 칸에 하이라이팅

set novisualbell " 비주얼벨 기능을 사용하지 않음 == 비프음 음소거
set nojoinspaces " J 명령어로 줄을 붙일 때 마침표 뒤에 한칸만 띔
set ruler " 상태표시줄에 커서 위치를 보여줌 "

" Tap space
set expandtab " tab to space
set tabstop=3 "간격
set shiftwidth=3 "자동 들여쓰기 간격

set keywordprg=man\ -a " K를 눌렀을 때 실행할 명령어 "
set showmode " 모드 보여 줌
set showcmd " (부분적인) 명령어를 상태라인에 보여줌 "
set showmatch " 매치되는 괄호의 반대쪽을 보여줌 "

" Search
set nowrapscan " 찾기에서 파일의 맨 끝에 이르면 계속하여 찾지 않음 "
set incsearch " 점진적으로 찾기 "
set hlsearch " highlight search result 
set hidden
set ignorecase " 찾기에서 대/소문자를 구별하지 않음 "
set smartcase

" 탭충은 웁니다
set list
set listchars=tab:▸\ ,trail:·

" no imdisable
set noimd
"IME set off
set imi=1
" 검색시 IME 상태 안 건드림
set ims=-1

set autowrite " :next 나 :make 같은 명령를 입력하면 자동으로 저장
set linespace=3 " 줄간격
set title " 타이틀바에 현재 편집중인 파일명을 표시
set keywordprg=wdic " 사전
