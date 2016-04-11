if &compatible
  set nocompatible
endif

" augroup PluginInstall
"   autocmd!
"   autocmd VimEnter * if dein#check_install() | call dein#install() | endif
" augroup END

let s:plugin_dir = expand('~/.vim/dein/')
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

if dein#load_state(s:plugin_dir)
  call dein#begin(s:plugin_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'mac': 'make -f make_mac.mak',
        \     'linux': 'make',
        \     'unix': 'gmake',
        \    },
        \ })
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim', {
    \ 'depends' : 'Shougo/unite.vim'
    \ })
  if has('lua')
    call dein#add('Shougo/neocomplete.vim', {
      \ 'depends' : 'Shougo/vimproc',
      \ 'autoload' : { 'insert' : 1,}
      \ })
  endif
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Townk/vim-autoclose')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('LeafCage/yankround.vim')
  call dein#add('Lokaltog/vim-easymotion')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('ConradIrwin/vim-bracketed-paste')
  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/landscape.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-endwise', {
    \ 'autoload' : { 'insert' : 1,}})
  call dein#add('junegunn/vim-easy-align', {
    \ 'autoload': {
    \   'commands' : ['EasyAlign'],
    \   'mappings' : ['<Plug>(EasyAlign)'],
    \ }})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

".vimrcを開く: <Space>e.
nnoremap <Space>e. :<C-u>edit $MYVIMRC<Enter>
".vimrcを反映: <Space>s.
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

"編集中のファイル名を表示
set title
"バイナリファイルの非印字可能文字を16進数で表示
set display=uhex
" タブが対応する空白の数
set tabstop=2
" 自動で挿入されるインデントのスペース幅
set shiftwidth=2
" tab キーを押した時に挿入されるスペース量
set softtabstop=0
"オートインデント
set smartindent
"大文字/小文字の区別なく検索する
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"自動再読み込み
set autoread
"新しい行のインデントを現在行と同じにする
set autoindent
"タブの代わりに空白文字を指定する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
"インクリメンタルサーチを行う
set incsearch
"行番号を表示する
set number
"閉括弧が入力された時、対応する括弧を強調する
set showmatch
"新しい行を作った時に高度な自動インデントを行う
set smarttab
set autoindent
" カーソルの位置表示を行う
set ruler
"ステータスライン
set laststatus=2
" set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
" 入力中のコマンドをステータスに表示する
set showcmd
" 検索結果ch
" 全モードでマウスを有効化
set mouse=a
" バックアップをとらない
set nobackup
" スワップファイルを作成しない
set noswapfile
" 行を強調表示
set cursorline
" コマンドを補完
set wildmenu
"TAB,EOFなどを可視化する
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,[,],<,>
"バックスペースにてインデントを削除
set backspace=indent,eol,start
"クリップボードをOSと共有する
set clipboard=unnamed,autoselect

syntax on

colorscheme jellybeans

let mapleader = "\<Space>"

" Normal
noremap j gj
noremap k gk
noremap <S-h> ^
noremap <S-j> }
noremap <S-k> {
noremap <S-l> $
" ;でコマンド入力
noremap ; :
noremap : ;
"検索結果ハイライトをEsc二回押しで消す
noremap <Esc><Esc> :nohlsearch<CR><Esc>
" Insert
inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-d> <Del>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>
" Normal+Visual
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q gq
nnoremap <C-h> :<C-u>h<Space>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" NERDCommenter
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
nmap <Leader>/ <Plug>NERDCommenterToggle
vmap <Leader>/ <Plug>NERDCommenterToggle

" lightline.vim
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"readonly":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
  \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
  \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \ },
  \ }

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" }}}

" yankround.vim {{{
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
"}}}

" vim-easy-align {{{
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)
" }}}

" matchit {{{
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" }}}
nmap <Tab> %
vmap <Tab> %

" vim-easymotion {{{
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'QZASDFGHJKL;'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
" }}}

" vim-indent-guide {{{
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
" }}}

" vimshell {{{
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}}
