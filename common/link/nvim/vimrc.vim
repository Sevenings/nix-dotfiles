" ====================
" Configurações Gerais 
" ==================== 
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent


set nocompatible
filetype off
filetype plugin indent on

set termguicolors
set cursorline
set background=dark
set encoding=UTF-8

set number relativenumber
set cursorline
set hlsearch

set nowrap
set scrolloff=8
set sidescrolloff=8

set foldmethod=indent
set foldlevel=99

" Para algum plugin aí, acho que o vimtex
set nosplitright

set noshowmode


" Startup do asyncrun
let g:asyncrun_open = 6

" =========
" FUNCTIONS
" =========

function TextModeOn()
    setlocal spell spelllang=pt_br,en
    set textwidth=67
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
endfunction

function TextModeOff()
    setlocal nospell 
    set textwidth=0
endfunction


function OpenTerminal()
    vsp
    term
endfunction

" ========
" COMMANDS
" ========

command Texton call TextModeOn()
command Textoff call TextModeOff()

command GenCMakeCompileCommands !cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1<CR>



" ========
" MAPPINGS
" ========
" Mappings movidos para lua/mappings.lua

" Vimtex plugin configuration test
"
"
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note: Most plugin managers will do this automatically!
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
" Note: Most plugin managers will do this automatically!
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'


" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
"let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
