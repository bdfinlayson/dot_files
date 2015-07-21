""
"" Janus setup
""

" Define paths
let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
let g:janus_custom_path = expand("~/.janus")
let g:neocomplcache_enable_at_startup = 1
let g:indent_guides_auto_colors = 0
let g:multi_cursor_use_default_mapping=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

set ruler
set showcmd
set noerrorbells
set showmatch
set wildmenu
set wildmode=list:longest,full
set autoindent
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set cursorline
set equalalways
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>



let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 0
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_coffeescript_checkers = ["coffeelint"]
let g:syntastic_cpp_compiler = "g++"
" let g:syntastic_cpp_compiler_options = " -std=c++11"
let g:syntastic_java_checkers = []
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")


"=========================
"YOUR CUSTOM MAPPINGS:
"=========================
"***SEE VIM KEY-NOTATION IN VIM HELP FOR HELP WITH VARIOUS KEY-CODES**


"WINDOW MANAGEMENT:
"Open with grid layout view
map <s-tab><s-g> :q<cr>:vsplit<cr>:split<cr>:wincmd l<cr>:split<cr>:wincmd h<cr>
"Open with 2 windows horizontally split
map <s-tab><s-o> :q<cr>:split<cr>
"Close two of four panes and split windows horizontally
map <s-tab><s-l> :wincmd j<cr>:q<cr>:wincmd l<cr>:wincmd j<cr>:q<cr>

"MOVING AROUND WINDOWS:
"Better window navigation
nnoremap <C-n> <C-w>j
nnoremap <C-m> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"MOVING AROUND BUFFERS:
"Tab to go to the next buffer
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"Shit-Tab to go to the previous buffer
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

"OPENING FILES:
" Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"SAVING AND QUITTING:
"Save all buffers
map <s-s><s-a> :w<cr>:wincmd l<cr>:w<cr>:wincmd j<cr>:w<cr>:wincmd h<cr>:w<cr>:wincmd k<cr>
"Save current buffer
map <s-s><s-b> :w<cr>
"Save current buffer and quit
map <s-s><s-q> :wq<cr>
"Quit current window without saving
map <s-x><s-b> :q<cr>
"Quit the grid view without saving
map <s-x><s-g> :q!<cr>:q!<cr>:q!<cr>:q!<cr>
"Quit the grid view and save
map <s-s><s-g> :wq<cr>:wq<cr>:wq<cr>:wq<cr>

"SHORTCUTS:
"FixWhitespace
map <s-f><s-w> :FixWhitespace<cr>


"============================
"JANUS AND VIM STUFF:
"============================

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" .vimrc.after is loaded after the plugins have loaded
