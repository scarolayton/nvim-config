:::plugins:::

call plug#begin('~/appData/Local/nvim/plugged') 	"directorio donde se van a instalar los plugins

"plugins
Plug 'joshdick/onedark.vim' 		"tema
Plug 'Yggdroot/indentLine' 		"indentacion
Plug 'mattn/emmet-vim' 			"emmet para diseño web
Plug 'vim-airline/vim-airline'		"diseño de la barra en la cual se muestran los modos, la linea, etc.
Plug 'vim-airline/vim-airline-themes'	"temas para el vim-airline
Plug 'christoomey/vim-tmux-navigator'	"poder navegar entre archivos abiertos
Plug 'jiangmiao/auto-pairs'		"autocompletado de llaves, corchetes, etc.
Plug 'alvan/vim-closetag'     "auto completado con otros simbolos
Plug 'tpope/vim-surround'     "to close tag for XML tags and more
Plug 'easymotion/vim-easymotion'   "navigate easily
Plug 'scrooloose/nerdtree'        "abrir arbol archivos
Plug 'sheerun/vim-polyglot'       "predicciones de varios lenguajes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tyewang/vimux-jest-test'    "FOR
Plug 'janko-m/vim-test'               "TESTING   
Plug 'junegunn/fzf'		"
Plug 'junegunn/fzf.vim'		
Plug 'mhinz/vim-signify' "sign when Change a Line
Plug 'tpope/vim-repeat'           "to repeat the last action made it
Plug 'HerringtonDarkholme/yats.vim'  "For TypeScript syntax highlighting
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
call plug#end() 			"cerramos el llamado de los plugins

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"CONFIGURACIONES BASICAS 
set number 				"muestra los numeros de cada linea en la parte izquierda 
set mouse=a 				"permite la interaccion con el mouse
set noshowmode				"me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
set clipboard=unnamedplus
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set encoding=utf-8 			"permite setear la codificación de archivos para aceptar caracteres especiales
set sw=2 				"la indentación genera 4 espacios
set nowrap
set showmatch
set ruler
set cursorline
set relativenumber
let g:NERDTreeShowHidden=1
set hidden
"el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
"set noswapfile				"para evitar el mensaje que sale al abrir algunos archivos sobre swap.
set clipboard=unnamed			"para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.	


"configuracion del tema
set termguicolors 			"activa el true color en la terminal
colorscheme onedark			"activar el tema onedark

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


"configuracion de emmet-vim

"easy motion map letter"
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
"configuracion de vim-airline
let g:airline#extensions#tabline#enabled = 1	"muestra la linea de pestaña en la que estamos buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'	"muestra solo el nombre del archivo que estamos modificando
let g:airline_theme='onedark'	"el tema de airline


"configuracion de nerdtree
"mapeando el abrir y cerrar de nerdtree con nerdtreetoggle vemos los archivos en el arbol y podemos cerrarlo a la vez, map es la C mayuscula representa e
"control y -n la tecla n lo que indica que realizará la siguiente funcion de excribir el comando NERDTreeToggle y CR significa ENTER.
nmap <Leader>nt :NERDTreeFind<CR>
map <Leader>p :Files<CR>
map <Leader>ag :Ag<CR>
"my own shortcuts to save and quit"
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
"buffer navigation
map <Leader>h :bprev<cr>
map <Leader>l :bnext<cr> 
map <Leader>c :bd<cr>
"   buffer
map <Leader>ob :Buffers<cr>

"testing
nnoremap <Leader>t :TestNearest<CR>
nnoremap <Leader>T :TestNearest<CR>
nnoremap <Leader>TT :TestNearest<CR>


"split resize
nnoremap <Leader>> 10<C-w>

"coc - Remap keys fot gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-definition)


"native faster scrolling 
nnoremap <C-j> 10<C-e> 
nnoremap <C-k> 10<C-y>


"Open a terminal
nnoremap <S-t> :botright :split term://bash<CR>
" Configuración de coc.nvim
autocmd! User ocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Ajustes específicos para JavaScript y Python
let g:coc_global_extensions = [
      \ 'coc-tsserver', 'coc-eslint',
      \ 'coc-json', 'coc-html',
      \ 'coc-pyright'
      \]

" Habilitar autocompletado para insert mode
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Mapeos para funciones de Coc
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>e  :<C-u>CocList extensions<CR>
nnoremap <silent> <space>o  :<C-u>CocList outline<CR>

" Muestra documentación flotante
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Muestra información de la firma
inoremap <expr> <C-Space> coc#refresh()

" Abre la ventana de sugerencias
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
                            
let g:NERDTreeQuitOnOpen = 1
