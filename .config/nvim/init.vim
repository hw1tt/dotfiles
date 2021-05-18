" PLUGINS
call plug#begin('~/.config/nvim/plugs')
" Allows you to e.g highlight text content and choose what characters to surround it. Allows removing surrounding characters too.
Plug 'tpope/vim-surround'
" Zen mode coding
Plug 'junegunn/goyo.vim'
" Automatically completes closing bracets etc when typing them - can be annoying at times.
Plug 'jiangmiao/auto-pairs'
" Allows move form tmux splits to vim instances
Plug 'christoomey/vim-tmux-navigator'
" Amazing finder plugin for searching files in your project various ways.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Comment and un comment lines fast
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Makes your movement w, b, e etc.. respect camel cased text.
Plug 'bkad/CamelCaseMotion'
Plug 'mhinz/vim-signify'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'haya14busa/incsearch.vim'
Plug 'hrsh7th/nvim-compe'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'neovim/nvim-lspconfig'
Plug 'folke/lsp-trouble.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-colors.nvim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'phaazon/hop.nvim'
Plug 'dyng/ctrlsf.vim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/completion-nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

set redrawtime=10000

filetype plugin on

" Map Leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Set relativenumber
set relativenumber

" On pressing tab, insert 2 spaces
set expandtab

" Show existing tab with 2 spaces width
set tabstop=2


set softtabstop=2
nno

"
set shiftwidth=2

" Allow mouse interaction with vim
set mouse=a

" Set color theme
syntax on


set termguicolors
set background=dark
colorscheme substrata

" Use clipboard for yanking, copy and pasting
"set clipboard=unnamedplus
"set clipboard^=unnamed
" Using system clipboard with ldr c and v
"noremap <Leader>c "+y
" Use normal p for pasteing as you have one clipboard either way
"noremap <Leader>v "+p
" using, I guess, a named registery so that we can do visual selecting and
" pasting without losing the yanked content
" using system clip board for all things
noremap y "+y
noremap Y "+Y
noremap x "+x
noremap p "+p
noremap P "+P
" Allow recursive search from where neovim was opened from
set path=.,/usr/include,,**

" Don't wrap round to the first solution found when searching and navigating the results
set nowrapscan

" Move to first search result when typing
set incsearch

" Reload opened files if external commands cause changes
set autoread

" Use spaces instead of actual tabs when pressing tab
set expandtab

" Vertically center scroll offset
set so=10

" Faster file content navigating with these keys because of their easier
" access
map <silent> <S-l> g_
map <silent> <S-h> _
map <silent> <S-k> (
map <silent> <S-j> )

" Improve scrolling performance when navigating through large results
set lazyredraw 

" Highlight cursorline 
set cursorline

set regexpengine=1
"
"
set wildignore+=**/node_modules/**   

" Ignore case only when the pattern contains no capital letters
set ignorecase smartcase 

"Refresh files
noremap <silent> <F5> :checktime<CR>

" Create new horizontal tmux pane
noremap <silent> <Leader>m :exe "!tmux split-window -v -p 50"<CR><CR>

"command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')|set hlsearch


" Replace current selection from the whole file with another string
" map <Leader>s :%s//
nmap <leader>s :%s#<C-r><C-w>#<C-r><C-w>#gIc<Left><Left><Left><Left>

" Replace something within visual selection
map <Leader>vs :s/

" Copy active file name to clipboard.
noremap <silent> <F4> :let @+=expand("%:p")<CR>

" Show various whitespace characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list

" Navigate splits via ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Refresh syntax highlighting - useful for large files that might break the highlighting
nmap <F6> :filetype detect<CR>

" Paste current timestamp with some whitespace and asterix
nnoremap <Leader>nt O<C-c>"=strftime("%c")<CR>Po* <C-c>o<C-c>kA

"Open file explorer 
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>e :Ex<CR>

"Faster writing of files
nnoremap <Leader>w :w<CR>

"Faster quitting from files
nnoremap <Leader>q :q<CR>
"nnoremap <Leader>q :bdelete<CR>

"Faster split
nnoremap <Leader>l :vsplit<CR>

nmap <silent><Leader>k gd<CR>

" No auto commenting
set formatoptions-=cro

set splitbelow
set splitright

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect,preview,noinsert

" Avoid showing message extra message when using completion
set shortmess+=c

" requires confirmation e.g when exiting unsaved file
set confirm

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

command T :let @+=expand("%:psdaasd")

"inoremap <expr> <C-t> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <c-j> pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<Up>"

inoremap <C-q> {}<ESC>i
inoremap <C-w> []<ESC>i
inoremap <C-t> `${}`<ESC>i

inoremap <C-r> /<ESC>li

nnoremap <silent> <Leader>u :Buffers<Esc>

nnoremap <silent> fo <cmd>lua vim.lsp.buf.formatting()<CR>
"autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
"
nnoremap <Leader>t <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>

nnoremap <Leader>j <cmd>LspTroubleToggle<cr>

nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>


nnoremap <Leader>g <cmd>lua vim.lsp.buf.references()<CR>


"
" INSTALLED PLUGIN SETTINGS " 
"
"junegunn/goyo.vim
nnoremap <silent> <Leader>H :Goyo<CR>
let g:goyo_linenr=1
let g:goyo_width="50%"
let g:goyo_height="90%"

"chirstoomeu/vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <c-ö> :TmuxNavigatePrevious<cr>


"tpope/vim-fugitive
nnoremap <silent> <Leader>b :Gblame<CR>

"nvim-telescope/telescope.nvim
nnoremap <leader>p <cmd>Telescope git_files<CR>
nnoremap <leader>r <cmd>Telescope live_grep<CR> 
nnoremap <leader>o <cmd>Telescope oldfiles<CR>
nnoremap <leader>å <cmd>Telescope file_browser<CR>

"bkad/CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

"junegunn/fzf
let $FZF_DEFAULT_OPTS="--preview 'bat --color=alwas"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

map <Leader>f /

"Plug nerdtree
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let NERDTreeShowHidden=1


"nvim-lsputils
lua <<EOF
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF


nnoremap <Leader>F :CtrlSF ""<left>
nnoremap <Leader>h <cmd>lua require'hop'.hint_words()<cr>

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


lua <<EOF
vim.g.lsp_utils_location_opts = {
	height = 54,
}
EOF

set re=2

"Plug completion-nvim
"autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)
nmap <silent> <c-p> <Plug>(completion_trigger)

"Plug compe
highlight link CompeDocumentation NormalFloat
inoremap <silent><expr> <C-l> compe#complete('<CR>')
inoremap <silent><expr> <C-l>     compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"Plug neoclide/coc.nvim
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
