syntax on
" Map <SPACE> as leader key
let mapleader = " "
set foldmethod=syntax
set noshowmatch
set noerrorbells
"---- coc
set nowrap
set nowritebackup
set noswapfile
set shortmess+=c
set nobackup
" coc"---- 

set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
set noshowmode

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

set encoding=UTF-8
" Let resume a buffer
set hidden

" Display line numbers
set nu

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ---------- Identation
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
" Identation -----------


" ---------- Search
set smartcase
set ignorecase
set incsearch
noremap <F4> :nohlsearch<CR>
" Search ---------- 


" Ignored files/directories from autocomplete (and CtrlP)
" plugins => NERDTreee / fzf
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/*

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Styled Components
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"AutoComplete pairs
Plug 'jiangmiao/auto-pairs'
" NERDTreee
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
" Git
Plug 'tpope/vim-fugitive'
" Undotree
Plug 'mbbill/undotree'
" Polyglot
Plug 'sheerun/vim-polyglot'
" fzf = A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'thiagoalessio/rainbow_levels.vim'
" Emoji extension
Plug 'kyuhi/vim-emoji-complete'
" Color Scheme
Plug 'dracula/vim'
call plug#end()

" ------------------ Color scheme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula
" Color scheme ------------------ 

" ------------------ Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Airline ------------------ 

" AutoComplete to emoji extension
let g:emoji_complete_overwrite_standard_keymaps = 0
imap <c-t> <Plug>(emoji-start-complete)


hi! link RainbowLevel0 Constant
hi! link RainbowLevel1 Type
hi! link RainbowLevel2 Function
hi! link RainbowLevel3 String
hi! link RainbowLevel4 PreProc
hi! link RainbowLevel5 Statement
hi! link RainbowLevel6 Identifier
hi! link RainbowLevel7 Normal
hi! link RainbowLevel8 Comment
map <leader>l :RainbowLevelsToggle<cr>
if executable('rg')
    let g:rg_derive_root='true'
endif
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
nnoremap <C-p> :Files<CR>
noremap <Leader>tr :NERDTreeToggle<CR>


let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✍️',
                \ 'Staged'    :'✅',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'💩',
                \ 'Deleted'   :'❌',
                \ 'Dirty'     :'✍️',
                \ 'Ignored'   :'🤙',
                \ 'Clean'     :'😌',
                \ 'Unknown'   :'?',
                \ }
"---------------------------------- COC
nmap <leader>gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"To make coc.nvim format your code on <cr>, use keymap:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" COC ---------------------------------- 

"Get off my lawn - helpful when learning Vim :)
 nnoremap <Left> :echoe "Use h"<CR>
 nnoremap <Right> :echoe "Use l"<CR>
 nnoremap <Up> :echoe "Use k"<CR>
 nnoremap <Down> :echoe "Use j"<CR>

