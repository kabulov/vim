" Plugin Manager - https://github.com/VundleVim/Vundle.vim

" NOTE: remember - default <Leader> symbol is either '/' or ','

" TODO: add cmake, debugging, copilot, ycm 
" ycm is for: syntax check, autocomplete, snippets, regex code search

" ==========================================================================================

" TODO:
" add key mappings here
"
" INFO: all main vim info here:
" https://habr.com/ru/companies/ruvds/articles/544160/
" https://gist.github.com/romainl/6b952db7a6138b48657ba0fbb9d65370
" https://vim.rtorr.com
" https://github.com/iggredible/Learn-Vim?tab=readme-ov-file
"
" ==========================================================================================
"
" ycm autocomplete:
" cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
" cp compile_commands.json to project root

" ctags:
" look at ~/.ctags

" ==========================================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Keep Plugin commands between vundle#begin/end.
Plugin 'xolox/vim-misc' "colorscheme-switcher helper
Plugin 'xolox/vim-colorscheme-switcher' "colorscheme switcher
Plugin 'flazz/vim-colorschemes' " better colorschemes
Plugin 'embark-theme/vim'
Plugin 'ycm-core/YouCompleteMe' " C++ autocomplete
Plugin 'preservim/nerdtree' " <L>n, <L>f
Plugin 'Xuyuanp/nerdtree-git-plugin' "NerdTree + Git
Plugin 'tpope/vim-fugitive' " Git: commands: blame, diff, log, add, ...(https://github.com/tpope/vim-fugitive)
Plugin 'airblade/vim-gitgutter' " Git changes in code. Parameter below is set to 100
Plugin 'ctrlpvim/ctrlp.vim' " https://github.com/ctrlpvim/ctrlp.vim "just ctrl + p
Plugin 'vim-airline/vim-airline' " Cool status line
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'easymotion/vim-easymotion' " LLs, LLf, LLw, LLl (L - Leader symbol)
Plugin 'terryma/vim-smooth-scroll' " ctrl+u|d|f|b (f|b - page, u|d - smooth)
Plugin 'preservim/tagbar' " ctrl + F9
Plugin 'octol/vim-cpp-enhanced-highlight' " better code highlight. params below
Plugin 'preservim/vim-indent-guides' " <L>i
Plugin 'tpope/vim-commentary' " comment lines. file types support. gc, gcc.
Plugin 'eugen0329/vim-esearch' " search across files
Plugin 'francoiscabrol/ranger.vim'
" Plugin 'jayli/vim-easycomplete' " https://github.com/silkeh/docker-clang/issues/2
" Plugin 'itchyny/vim-cursorword' " highlight words
" Plugin 'bullets-vim/bullets.vim' " to-do list in txt file
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'ilyachur/cmake4vim' "cmake integration : https://github.com/ilyachur/cmake4vim
" Plugin 'vim-syntastic/syntastic' " maybe conflict with ycm
" Plugin 'preservim/nerdcommenter' " comment functions
" Plugin https://github.com/ludovicchabant/vim-gutentags
" Plugin https://github.com/SirVer/ultisnips

" All of your Plugins must be added before the following line
call vundle#end()            " required
" set runtimepath+=~/.vim/bundle/YouCompleteMe/
filetype plugin indent on    " required

" PLUGINS END

" ==========================================================================================

" switch between hpp, cpp, tpp
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>
map <F3> :e %:p:s,.hpp$,.X123X,:s,.tpp$,.hpp,:s,.X123X$,.tpp,<CR>

" next/prev tab
map <F6> :tabp<CR>
map <F7> :tabn<CR>

" remove trailing spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" add tags, navigate with ctrl+] (forward), ctrl+t (back), rerun before usage
set tags+=~/tags

" autogenerate ctags:
" https://kulkarniamit.github.io/whatwhyhow/howto/use-vim-ctags.html
" https://stackoverflow.com/questions/155449/vim-auto-generate-ctags
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" render tpp as cpp
autocmd BufEnter *.tpp :setlocal filetype=cpp

" encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" indent width
set shiftwidth=2
set smartindent
set autoindent
set cindent

" tab width and smarttab
set softtabstop=2
set expandtab
set smarttab

" search highlight all/off
set hlsearch
nnoremap <C-L> :nohlsearch<CR>

" misc
set number " enumerate lines
set showmatch " highlight matching parenthesis
set backspace=indent,eol,start " smart backspace
set undolevels=1000 " undo amount
set belloff=all " disable blink (visual bell)

" misc misc
syntax on

" colorscheme:
" colorscheme elflord
colorscheme molokai
" colorscheme monokai-phoenix
" colorscheme embark

" ctrl keymappings do not work fix: https://codeberg.org/dnkl/foot/issues/849                                                                                                                                     
let &t_TI = "^[[>4;2m"                                                                                                                                                                                            
let &t_TE = "^[[>4m"                                                                                                                                                                                              

" colorscheme broke
highlight Comment ctermfg=gray                                                                                                                                                                                    
highlight Visual cterm=none ctermbg=darkgrey ctermfg=none      

" NerdTree:
nnoremap <leader>f :wincmd p \| :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" no need with vim-commentary:
" vnoremap <C-m> :norm i//<CR> " comment
" vnoremap <S-m> :norm xx<CR> " uncomment
" " noremap <leader>/ :Commentary<cr>

" gitgutter update faster:
set updatetime=100

" airline add tab bars:
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " filename-modifiers

" vim-smooth-scroll:
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" TagBar:
map <F9> :TagbarToggle<CR>

" Code highlight (vim-cpp-enhanced-highlight):
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
"let c_no_curly_error=1

" easymotion:
map <Leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-bd-jk)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" quick tab navigation
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <leader><tab> gt
nnoremap <leader><s-tab> gT

" colored indent, use <L>i for toggle
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_buftype = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=gray
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" vim-esearch:
" Use <c-f><c-f> to start the prompt, use <c-f>iw to pre-fill with the current word
" or other text-objects. Try <plug>(esearch-exec) to start a search instantly.
nmap <c-f><c-f> <plug>(esearch)
map  <c-f>      <plug>(operator-esearch-prefill)

let g:esearch = {}
" Use regex matching with the smart case mode by default and avoid matching text-objects.
let g:esearch.regex   = 1
let g:esearch.textobj = 0
let g:esearch.case    = 'sensitive'
" Set the initial pattern content using the highlighted '/' pattern (if
" v:hlsearch is true), the last searched pattern or the clipboard content.
let g:esearch.prefill = ['hlsearch', 'last', 'clipboard']
" Override the default files and directories to determine your project root. Set it
" to blank to always use the current working directory.
let g:esearch.root_markers = ['.git', 'Makefile', 'node_modules']
" Prevent esearch from adding any default keymaps.
" let g:esearch.default_mappings = 0
" Start the search only when the enter is hit instead of updating the pattern while you're typing.
" let g:esearch.live_update = 0

" ranger
" <L>r - run ranger
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
" this path is relative to home dir (maybe because i didnt type make install)
let g:ranger_choice_file = ".vim/tmp/chosenfile"
" use range for dirs instead of nedtree
" let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
" let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
" didnt type make install, shows hidden files, just cloned repo into ~/ranger
let g:ranger_command_override = 'python3 /home/kozim_kabulov/ranger/ranger/ranger.py --cmd "set show_hidden=true"'
" ranger faq: https://github.com/ranger/ranger/wiki/FAQ%3A-Frequently-Asked-Questions
" ranger man: https://github.com/ranger/ranger/wiki/Official-user-guide

" easycomplete
" let g:easycomplete_tab_trigger="<c-s>"

" syntastic:
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
