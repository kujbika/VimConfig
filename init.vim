" normal vim configurations, aka vimrc
syntax on
let mapleader = ","
" this is crucial below
set clipboard+=unnamedplus
noremap <leader><CR> :edit ~/.config/nvim/init.vim<CR>
set guicursor=
set noshowmatch
set lazyredraw"
set relativenumber
set nohlsearch
set hidden
set noerrorbells
filetype indent plugin on
syntax enable
set tabstop=4 softtabstop=4
set shiftwidth=4
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
set ruler 
set showcmd
set wildmenu
set ignorecase
set number
set lbr
set autoindent
set smarttab
nmap [b :bnext<CR>
nmap ]b :bprev<CR>
noremap ;; :%s:::gc<Left><Left><Left><Left>
vnoremap <leader>p "_dP
map <leader>w :w!<CR>
map <leader>q :q<CR>
map 0 ^
:imap jj <ESC>
tnoremap jj <C-\><C-n>
tmap <C-h> <C-\><C-n><C-h>
inoremap II <ESC>I
inoremap AA <ESC>A
nmap <leader>c ciw
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.idea$', '\metals$', '\.bloop$']
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nmap <space>r :NERDTreeFocus<CR>R<C-w><C-p> 
map <leader>f :NERDTreeFind<CR> 
nnoremap <silent> <expr> <leader>f g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
highlight ColorColumn ctermbg=0 guibg=lightgrey
au BufRead,BufNewFile *.sbt, *.scala set filetype-scala
" Coc settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
autocmd FileType cs nmap <buffer> <leader>gd <Plug>(omnisharp_go_to_definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
autocmd FileType cs nmap <buffer> <leader>gi <Plug>(omnisharp_find_implementations)
nmap <leader>gr <Plug>(coc-references)
autocmd FileType cs nmap <buffer> <leader>gr <Plug>(omnisharp_find_usages)
nnoremap <leader>rn :CocSearch <C-R>=expand("<cword>")<CR><CR>
autocmd FileType cs nmap <buffer> <leader>rn <Plug>(omnisharp_rename)
autocmd FileType cs nmap <buffer> <leader><leader>c <Plug>(omnisharp_global_code_check)
nnoremap <silent> <leader>tc :<C-u>CocList diagnostics<CR> 
nnoremap <silent> <leader>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
nnoremap <silent> <leader>sc :<C-u>CocCommand metals.new-scala-file<CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
autocmd FileType cs nmap <buffer> <silent> K <Plug>(omnisharp_preview_definition)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>a  <Plug>(coc-codeaction)<CR> 
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" fzf finder
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <leader>rg :Rg<CR>

call plug#begin(stdpath('data') . '/plugged') 
Plug 'rhysd/clever-f.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
Plug 'satabin/hocon-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion' 
Plug 'terryma/vim-multiple-cursors' 
Plug 'vim-scripts/argtextobj.vim' 
Plug 'tommcdo/vim-exchange' 
Plug 'kana/vim-textobj-entire' 
Plug 'kana/vim-textobj-user'
Plug 'jpalardy/vim-slime'
Plug 'puremourning/vimspector', {'do':'./install_gadget.py'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'szw/vim-maximizer'
Plug 'machakann/vim-highlightedyank'
Plug 'fcpg/vim-shore'
call plug#end()
let g:OmniSharp_start_without_solution = 1
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf' 
let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal'
\}
" Enable snippet completion, using the ultisnips plugin
let g:OmniSharp_want_snippet=1
autocmd CursorHold *.cs OmniSharpTypeLookup

let g:slime_target = "neovim"
" let g:UltiSnipsExpandTrigger="<tab>"
" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
" vim airline setting
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_selection='0'
let g:airline_theme='deus'
colorscheme gruvbox
set background=dark
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#ClearLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>dp <Plug>VimspectorPause
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint



set runtimepath^=~/_vim runtimepath+=~/_vim/after
let &packpath = &runtimepath
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
autocmd StdinReadPre * let s:std_in=1

"fugitive 
nmap <leader>df :Gvdiffsplit!<CR>
nmap <leader>gl :diffget //3 <bar> diffupdate<CR>
nmap <leader>gg :diffget //2 <bar> diffupdate<CR>
nmap <leader>gp :Git push <CR>
nmap <leader>gs :Gstatus<CR>:10wincmd_<CR>
nmap <leader>gw :Gwrite<CR>

" vim multiple cursors
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1
" NOTE TO SELF: you may not need vim multiple cursors and easymotion
"
if exists('+termguicolors')
    let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"
endif

let g:easymotion#is_active = 0
function! EasyMotionCoc() abort
  if EasyMotion#is_active()
    let g:easymotion#is_active = 1
    silent! CocDisable
  else
    if g:easymotion#is_active == 1
      let g:easymotion#is_active = 0
      silent! CocEnable
    endif
  endif
endfunction
a
