let mapleader = " "
let g:copilot_enabled = v:false

set nocompatible
set showmatch
set ignorecase
set mouse=v
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set relativenumber
set wildmode=longest,list
set cc=80
filetype plugin indent on
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast
set nofixeol

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
    Plug 'dracula/vim'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'ThePrimeagen/harpoon'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'MunifTanjim/prettier.nvim'
    Plug 'github/copilot.vim'
    Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }
call plug#end()

lua << EOF
local prompts = require('CopilotChat.prompts')
local select = require('CopilotChat.select')

require("CopilotChat").setup {
  debug = false,

  question_header = '## User ',
  answer_header = '## Copilot ',
  error_header = '## Error ',
  separator = '---',

  selection = function(source)
    return select.visual(source) or select.line(source)
  end,

  window = {
      layout = 'float',
  },
}
EOF

if (has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme dracula

set splitright
set splitbelow

inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap gf :vert winc f<cr>

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>ee :Ex<CR>

nnoremap <leader>ha <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hh <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <A-[> <cmd>lua require("harpoon.ui").nav_prev()<CR>
nnoremap <A-]> <cmd>lua require("harpoon.ui").nav_next()<CR>

nnoremap <leader>ff :FZF<CR>

nnoremap mm :nohl<CR>
nnoremap ml :%s/\r//g<CR>

nnoremap <leader>yb :!yarn build<CR>
nnoremap <leader>yi :!yarn install<CR>
nnoremap <leader>ys :!yarn start<CR>
nnoremap <leader>yt :!yarn test<CR>

nnoremap <leader>dr :!dotnet run<CR>

nnoremap <leader>p <Plug>(prettier-format)<CR>

nnoremap <C-p> :CopilotChatToggle<CR>
nnoremap <leader>ps :CopilotChatStop<CR>
nnoremap <leader>pr :CopilotChatReset<CR>
vnoremap <leader>pe :CopilotChatExplain<CR>
vnoremap <leader>pr :CopilotChatReview<CR>
vnoremap <leader>pf :CopilotChatFix<CR>
vnoremap <leader>po :CopilotChatOptimize<CR>
vnoremap <leader>pd :CopilotChatDocs<CR>
vnoremap <leader>pt :CopilotChatTests<CR>
