set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
" My Bundles here:
"
" original repos on github
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-rooter'
Plugin 'gkz/vim-ls'

Plugin 'scrooloose/nerdcommenter'
Plugin 'yggdroot/indentline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'

" VimScripts
"Plugin 'L9'
" Bundle 'FuzzyFinder'
" non github repos
"Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()            " required
filetype plugin indent on     " required!

set nocompatible                        "несовместимы с Vi
set nobackup                            "не создавать файлы с резервной копией (filename.txt~)"
set noswapfile                          "и свапов нам тоже не надо
set history=50                          "сохранять 50 строк в истории командной строки
set ruler                               "постоянно показывать позицию курсора
set incsearch                           "показывать первое совпадение при наборе шаблона
set nohlsearch                          "подсветка найденного
set autoindent                          "включаем умные отступы
set smartindent
set ai                                  "при начале новой строки, отступ копируется из предыдущей
set ignorecase                          "игнорируем регистр символов при поиске
set background=dark                     "фон терминала - темный
set ttyfast                             "коннект с терминалом быстрый
set novisualbell                        "не мигаем вместо пищания
set showmatch                           "показываем открывающие и закрывающие скобки
set shortmess+=tToOI                    "убираем заставку при старте
set rulerformat=%(%l,%c\ %p%%%)         "формат строки состояния строка х столбец, сколько прочитано файла в %
set wrap                                "не разрывать строку при подходе к краю экрана
set linebreak                           "переносы между видимыми на экране строками только между словами
set tabstop=4                           "размер табуляции
set shiftwidth=4                        "число пробелов, используемых при автоотступе
set softtabstop=4

set expandtab                           "Заменяем табуляции пробелами (use :retab dude)

set t_Co=256                            "включаем поддержку 256 цветов
set wildmenu                            "красивое автодополнение
set wcm=<Tab>                           "WTF? but all work
set whichwrap=<,>,[,],h,l               "не останавливаться курсору на конце строки
set encoding=utf8                       "кодировка по дефолту
set termencoding=utf8                   "Кодировка вывода на терминал
set fileencodings=utf8,cp1251,koi8r     "Возможные кодировки файлов (автоматическая перекодировка)
set showcmd                             "показывать незавершенные команды и текущий режим

set tpm=100                             "максимальное количество открытых табов
set wak=yes                             "используем ALT как обычно, а не для вызова пункта мени
set noex                                "не читаем файл конфигурации из текущей директории
set list                                "Отображаем табуляции и конечные пробелы...
set listchars=tab:→→,trail:.
" set fo+=cr

" Enable mouse

set mouse=a
set mousemodel=popup

set clipboard=exclude:.*
" set clipboard=unnamedplus

set hidden
set nu
" set guifont=Consolas\ 12
" set guifont=Droid\ Sans\ Mono\ 12
set guifont=PragmataPro\ 13
set backspace=indent,eol,start
" Make <Backspace> act as <Delete> in Visual mode?
vmap <BS> x

colorscheme mustangpp_op

if has ("gui_running")
    "убираем меню и тулбар
    set guioptions-=m
    set guioptions-=T
    "убираем скроллбары
    set guioptions-=l
    set guioptions-=r
    set guioptions-=b
    set guioptions=
    "используем консольные диалоги вместо графических
    set guioptions+=c
    "антиалиасинг для ШГ
    set antialias
    "прячем курсор
    set mousehide
    "Так не выводятся ненужные escape последовательности в :shell
    set noguipty
    "подсветка текущей строки
    set cursorline

    "fonts
    if has("gui_gtk2")
    	set guifont=Inconsolata\ 10
    elseif has("gui_macvim")
    	set guifont=Menlo\ Regular:h12
    elseif has("gui_win32")
    	set guifont=Consolas:h11:cANSI
    endif

endif

set scrolljump=7
set scrolloff=7
set dir=/tmp

syntax on
filetype plugin on
let mapleader = ","

imap <Ins> <Esc>wq

map <C-p> :FufFile **/<CR>
vmap <C-p> <esc>:FufFile **/<CR>
imap <C-p> <esc>:FufFile **/<CR>

"# - move lines
nnoremap <C-j> :m .+1<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv

nnoremap <C-k> :m .-2<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <C-h> <<_
inoremap <C-h> <C-D>
vnoremap <C-h> <gv

nnoremap <C-l> >>_
inoremap <C-l> <C-T>
vnoremap <C-l> >gv

" F2 - сохранить файл
map <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - кодоспецифично

" F4 - Следующая ошибка
map <F4> :cc<cr>
vmap <F4> <esc>:cc<cr>i
imap <F4> <esc>:cc<cr>i


" F5 - Текущая
map <F5> :cn<cr>
vmap <F5> <esc>:cn<cr>i
imap <F5> <esc>:cn<cr>i

" F6 - предыдущий буфер
map <F6> :lclose<cr>:bp<cr>
vmap <F6> <esc>:lclose<cr>:bp<cr>i
imap <F6> <esc>:lclose<cr>:bp<cr>i

" F7 - следующий буфер
map <F7> :lclose<cr>:bn<cr>
vmap <F7> <esc>:lclose<cr>:bn<cr>i
imap <F7> <esc>:lclose<cr>:bn<cr>i


map <C-tab> :FufBuffer<CR>
vmap <C-tab> <esc>:FufBuffer<CR>
imap <C-tab> <esc>:FufBuffer<CR>

map <F11> :NERDTreeToggle<cr>
vmap <F11> <esc>:NERDTreeToggle<CR>
imap <F11> <esc>:NERDTreeToggle<CR>

map <F12> :Explore<cr>
vmap <F12> <esc>:Explore<CR>
imap <F12> <esc>:Explore<CR>

if &readonly == 1
    set nofoldenable
    nmap <F10> :qa<cr>
    nmap <Esc> :qa!<CR>
    nmap <Space> <PageDown>
endif

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

let vimclojure#HighlightBultins=1
let vimclojure#ParenRainbow=1

let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$'
\.'|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
\.'|(^|[/\\])(node_modules|libs|dist|build|web)[/\\]'

set rnu

set complete=""
set complete+=.
set complete+=k
set complete+=b
set completeopt-=preview
set completeopt+=longest

autocmd FileType javascript set ts=4 sw=4 sts=4
autocmd FileType less set syntax=scss
autocmd FileType typescript :set syntax=javascript
autocmd FileType ls set ts=2 sw=2 sts=2

" silent sball
