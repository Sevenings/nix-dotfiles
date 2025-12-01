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

" VimTeX configuration moved to lua/plugins/vimtex.lua
