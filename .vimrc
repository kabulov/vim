
"DESCRIPTION:
" this is .vimrc example 

"=== shortcuts used in this config:

"C-n - nerdtree
"F6 - tabp
"F7 - tabn
"F8 - next color 
"Shift F8 - prev color
"F9 - code layout tab
"F2 - smart copypaste to vim

"=== YouCompleteMe

"Use ./configure --prefix=$HOME/somepath !!!
"youcompleteme installation guide
" http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/
"ycmd config file
" https://github.com/rasendubi/dotfiles/blob/master/.vim/.ycm_extra_conf.py -
"youcompleteme github repo
" https://github.com/Valloric/YouCompleteMe#fedora-linux-x64-installation
"original site
" http://valloric.github.io/YouCompleteMe/
"vim download site
" http://www.vim.org/download.php
"install vim without root permissions
" http://superuser.com/questions/162560/how-to-install-vim-on-linux-when-i-dont-have-root-permissions
"install vim with python support
" http://stackoverflow.com/questions/20160902/how-to-solve-requires-python-2-x-support-in-linux-vim-and-it-have-python-2-6-6
"get cmake bin or sources  (wget - url to file)
" https://cmake.org/download/

"=== MISC

"http://valloric.github.io/YouCompleteMe/
"https://robertmelton.com/2014/05/27/vim-and-me/
"https://github.com/scrooloose/nerdtree/issues/521

"=================================================================================================

"begin Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'gmarik/Vundle.vim' "authors page

"The following are examples of different formats supported.
"Keep Plugin commands between vundle#begin/end.

"plugin on GitHub repo
 
Plugin 'scrooloose/nerdtree' "explorer
Plugin 'jistr/vim-nerdtree-tabs' "explorer for all tabs
Plugin 'majutsushi/tagbar' "explore code layout | hint: goto easytags for more
Plugin 'ervandew/supertab' "word completion on steroids 
Plugin 'xolox/vim-misc' "colorscheme-switcher helper
Plugin 'xolox/vim-colorscheme-switcher' "colorscheme switcher
Plugin 'jiangmiao/auto-pairs' "autocomplete pairs
"Plugin 'tpope/vim-fugitive'
"Plugin 'vim-airline/vim-airline'
"Plugin 'bronson/vim-trailing-whitespace' "clean trailing whitespaces
"Plugin 'ntpeters/vim-better-whitespace' "better whitespace 
"Plugin 'Lokaltog/vim-powerline' "cool statusline
"Plugin 'altercation/vim-colors-solarized' "solarized colorscheme
"Plugin 'scrooloose/syntastic'
"Plugin 'google/styleguide'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'easymotion/vim-easymotion'
"Plugin 'FunkMonkey/libClang'
"Plugin 'Valloric/YouCompleteMe'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9

"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"end Vundle

"=================================================================================================

"begin plugin related configs

"=== ycm 
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let mapleader=","

"=== NERDTree
"autostart NERDTree on startup
" autocmd vimenter * NERDTree
"autostart nerdtree-tabs on startup
" let g:nerdtree_tabs_open_on_console_startup=1
"map ctrl-n to open/close nerdtree
map <C-n> :NERDTreeTabsToggle<CR>

"=== tagbar
let g:tagbar_ctags_bin = '/path/to/ctags' "usually /usr/local/bin/ctags 
nmap <F9> :TagbarToggle<CR>

"=== supertab
let g:SuperTabDefaultCompletionType = "<c-n>" "scroll top->bottom

"=== autopairs 
let g:AutoPairsFlyMode = 0 "turn to 1 if annoying
let g:AutoPairsShortcutBackInsert = '<M-b>'

"=== powerline
" set laststatus=2
" let g:airline_powerline_fonts = 1

"=== whitespace 
" highlight ExtraWhitespace ctermbg=white
" map <C-w> :ToggleWhitespace<CR>

"=== solarized colorscheme - dark
" requires in .bashrc : export TERM="xterm-256color"
"set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

"=== syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"=== cpplint related to syntastic
"let g:syntastic_cpp_cpplint_thres = 5 
"let g:syntastic_cpp_cpplint_args = "--verbose=3"

"end plugin related configs

"=================================================================================================

" all other configs

"set mouse=a
"set virtualedit=all
set confirm
set ruler
set wildmenu
set showcmd
set hlsearch
set laststatus=2
set lazyredraw
"set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n] 
set cmdheight=1
set incsearch
nnoremap <C-L> :nohl<CR><C-L>
set runtimepath+=$HOME/.vim/colors
set runtimepath+=$HOME/.vim/plugin
colorscheme torte 
"colorscheme  murphy
"colorscheme evening
"colorscheme morning
"colorscheme delek
"colorscheme blue
set number
set sw=2
set tabstop=2
set expandtab
map <F6> :tabp<CR>
map <F7> :tabn<CR>
set foldmethod=syntax "indent
nnoremap <C-Right> zo
nnoremap <C-Left> zc
inoremap <C-Right> <C-O>zo
inoremap <C-Left> <C-O>zc
"set background=dark
highlight Pmenu ctermbg=blue ctermfg=green
highlight PmenuSel ctermbg=grey ctermfg=white
"filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set tags+=./tags;$HOME
map <M-Left> <C-T>
map <M-Right> <C-]>
map <M-Up> 0u
set pastetoggle=<F2>
set autoindent
set cindent
if match($TERM, "screen")!=-1
  set term=xterm
endif

"=================================================================================================

" omnicompletion (c++ autocomplete)

" omnicppcomplete options
map <C-X><C-G> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/commontags /usr/include /usr/local/include<CR>
set tags+=~/.vim/commontags

" --- OmniCppComplete ---
" -- required --
set nocp " non vi compatible mode

" -- optional --
" auto close options when exiting insert mode or moving away
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces
let g:completekey = "<s-tab>"

set completeopt+=longest
"set complete-=i

" -- ctags --
" generate
map <C-X><C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" add current directory's generated tags file to available tags
set tags+=./tags

" Setup the tab key to do autocompletion
function! CompleteTab()
  let prec = strpart( getline('.'), 0, col('.')-1 )
  if prec =~ '^\s*$' || prec =~ '\s$'
    return "\<tab>"
  else
    return "\<C-X>\<C-O>"
  endif
endfunction

inoremap <tab> <c-r>=CompleteTab()<CR>

