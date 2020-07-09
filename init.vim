
"
" Vim settings for @mscoutermarsh
"

" Settings in this file may depend on plugins, so let's install them first.
" Not to be confused with the contents of ~/.vim/plugin/* which are
" configuration options for each plugin and automatically loaded by Vim.
source ~/.config/nvim/plugin/plugins.vim

" Get off my lawn - helpful when learning Vim :)
 nnoremap <Left> :echoe "Use h"<CR>
 nnoremap <Right> :echoe "Use l"<CR>
 nnoremap <Up> :echoe "Use k"<CR>
 nnoremap <Down> :echoe "Use j"<CR>

 " Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :q<CR>
map <Leader>gs :Gstatus<CR>

" Recently edited files
map <Leader>h :History<CR>

" CtrlP use FZF (faster!)
nnoremap <C-p> :Files<Cr>

syntax on
autocmd Filetype scss if getfsize(@%) > 300 | setlocal syntax=OFF | endif

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

" Showcase comments in italics
highlight Comment cterm=italic gui=italic

" Open most recently used files on start
" autocmd VimEnter * Mru .

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

