syntax on
let mapleader = " "
set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode

set foldmethod=syntax


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=90
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Ignored files/directories from autocomplete (and CtrlP)
" plugins => NERDTreee / fzf
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/*
"Execute pythonfiles in terminal
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

call plug#begin('~/.vim/plugged')

Plug 'leafoftree/vim-vue-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"AutoComplete pairs
 Plug 'jiangmiao/auto-pairs'
" NERDTreee
 Plug 'preservim/nerdtree'
" Git
Plug 'tpope/vim-fugitive'
" Undotree
Plug 'mbbill/undotree'
" Polyglot
Plug 'sheerun/vim-polyglot'
" fzf = A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug '/home/mpaulson/personal/vim-be-good'
Plug 'thiagoalessio/rainbow_levels.vim'
" Adicionando AutoComplete do mysql
Plug 'vim-scripts/dbext.vim'
" Lit para o python
Plug 'nvie/vim-flake8'
" Emoji extension
Plug 'kyuhi/vim-emoji-complete'
call plug#end()

" AutoComplete to emoji extension
let g:emoji_complete_overwrite_standard_keymaps = 0
imap <c-t> <Plug>(emoji-start-complete)


let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

hi! RainbowLevel0 ctermbg=240 guibg=#585858
hi! RainbowLevel1 ctermbg=239 guibg=#4e4e4e
hi! RainbowLevel2 ctermbg=238 guibg=#444444
hi! RainbowLevel3 ctermbg=237 guibg=#3a3a3a
hi! RainbowLevel4 ctermbg=236 guibg=#303030
hi! RainbowLevel5 ctermbg=235 guibg=#262626
hi! RainbowLevel6 ctermbg=234 guibg=#1c1c1c
hi! RainbowLevel7 ctermbg=233 guibg=#121212
hi! RainbowLevel8 ctermbg=232 guibg=#080808
map <leader>l :RainbowLevelsToggle<cr>
if executable('rg')
    let g:rg_derive_root='true'
endif
"------------------------------------LEADERKEYS
"------------------------------------GENERAL
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
nnoremap <leader>q :q<CR>
"------------------------------------GIT
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gh :diffget //2<CR>
nmap <Leader>gl :diffget //3<CR>
"------------------------------------FILES
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>h :History<CR>
nnoremap <C-p> :Files<CR>
noremap <Leader>tr :NERDTree<CR>
"---------------------------------- vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
"---------------------------------- GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
"use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"coc-prettier 
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"To make coc.nvim format your code on <cr>, use keymap:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Get off my lawn - helpful when learning Vim :)
 nnoremap <Left> :echoe "Use h"<CR>
 nnoremap <Right> :echoe "Use l"<CR>
 nnoremap <Up> :echoe "Use k"<CR>
 nnoremap <Down> :echoe "Use j"<CR>

