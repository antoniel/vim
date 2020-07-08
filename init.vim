call plug#begin()
  Plug 'morhetz/gruvbox' "Esquema de cores
  Plug 'sheerun/vim-polyglot' "SyntaxHighlight	
  Plug 'ncm2/ncm2' "Autocomplete assim que digita
  Plug 'w0rp/ale' "Lint de varios códigos
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "Auto complete
call plug#end()
colorscheme gruvbox
set background=dark


" SEARCH ------------------------
set wildignore+=**/node_modules/* "Permite que o vim olhe outras pastas além do .
set hlsearch	"Highlight all search results
set hidden "Permite trocar de arquivos sem necessariamente salvar
set path+=** "possibilita a pesquisa em subdiretorios
set wildmenu "Numa situação que o vim encontra mais de uma opção para o finde você pdoe escolher qual quer

" UTIL
set number "Habilita as linhas nos arquivos 
set inccommand=split "Permite ver substituições de palavras em tempo real
set relativenumber
