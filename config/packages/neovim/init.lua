lua require("plugins")

-- Leader key
vim.g.mapleader = " "

-- Disable Copilot by default
vim.g.copilot_enabled = false

-- Basic settings
vim.opt.compatible = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "v"
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Tab and indentation settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Command-line completion mode
vim.opt.wildmode = { "longest", "list" }

-- Column marker at 80 characters
vim.opt.colorcolumn = "80"

-- Enable filetype plugins and indentation
vim.cmd("filetype plugin indent on")

-- Enable syntax highlighting
vim.cmd("syntax on")

-- Enable mouse support
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable cursorline
vim.opt.cursorline = true

-- Optimize for fast terminal
vim.opt.ttyfast = true

-- Do not add a newline at the end of the file
vim.opt.fixeol = false

-- Copilot Chat
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

if vim.fn.has("termguicolors") == 1 then
    vim.opt.termguicolors = true
end

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Set colorscheme to dracula
vim.cmd("colorscheme dracula")

-- Open new vertical splits to the right
vim.opt.splitright = true

-- Open new horizontal splits below
vim.opt.splitbelow = true

-- Insert mode mappings
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })

-- Visual mode mappings
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Normal mode mappings for window movement
vim.api.nvim_set_keymap('n', '<A-h>', '<C-W>H', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-W>J', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-W>K', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-W>L', { noremap = true, silent = true })

-- Normal mode mappings for window navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Normal mode mapping for opening file in vertical split
vim.api.nvim_set_keymap('n', 'gf', ':vert winc f<CR>', { noremap = true, silent = true })

-- Insert mode mappings for CoC (Conquer of Completion)
vim.api.nvim_set_keymap('i', '<CR>', [[coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<Tab>', [[coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]], { noremap = true, silent = true, expr = true })

-- Normal mode mappings for NERDTree
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true })

-- Normal mode mapping for opening file explorer
vim.api.nvim_set_keymap('n', '<leader>ee', ':Ex<CR>', { noremap = true, silent = true })

-- Harpoon mappings
vim.api.nvim_set_keymap('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-[>', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-]>', '<cmd>lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })

-- FZF mapping
vim.api.nvim_set_keymap('n', '<leader>ff', ':FZF<CR>', { noremap = true, silent = true })

-- Miscellaneous mappings
vim.api.nvim_set_keymap('n', 'mm', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ml', ':%s/\\r//g<CR>', { noremap = true, silent = true })

-- Yarn mappings
vim.api.nvim_set_keymap('n', '<leader>yb', ':!yarn build<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yi', ':!yarn install<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ys', ':!yarn start<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yt', ':!yarn test<CR>', { noremap = true, silent = true })

-- Dotnet mapping
vim.api.nvim_set_keymap('n', '<leader>dr', ':!dotnet run<CR>', { noremap = true, silent = true })

-- Prettier mapping
vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>(prettier-format)', { noremap = true, silent = true })

-- Copilot Chat mappings
vim.api.nvim_set_keymap('n', '<C-p>', ':CopilotChatToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':CopilotChatStop<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pr', ':CopilotChatReset<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pe', ':CopilotChatExplain<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pr', ':CopilotChatReview<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pf', ':CopilotChatFix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>po', ':CopilotChatOptimize<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pd', ':CopilotChatDocs<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pt', ':CopilotChatTests<CR>', { noremap = true, silent = true })

-- Harpoon mappings
vim.api.nvim_set_keymap('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hh', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-[>', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-]>', '<cmd>lua require("harpoon.ui").nav_next()<CR>', { noremap = true, silent = true })

-- FZF mapping
vim.api.nvim_set_keymap('n', '<leader>ff', ':FZF<CR>', { noremap = true, silent = true })

-- Miscellaneous mappings
vim.api.nvim_set_keymap('n', 'mm', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ml', ':%s/\\r//g<CR>', { noremap = true, silent = true })

-- Yarn mappings
vim.api.nvim_set_keymap('n', '<leader>yb', ':!yarn build<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yi', ':!yarn install<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ys', ':!yarn start<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>yt', ':!yarn test<CR>', { noremap = true, silent = true })

-- Dotnet mapping
vim.api.nvim_set_keymap('n', '<leader>dr', ':!dotnet run<CR>', { noremap = true, silent = true })

-- Prettier mapping
vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>(prettier-format)', { noremap = true, silent = true })

-- Copilot mappings
vim.api.nvim_set_keymap('n', '<C-p>', ':CopilotChatToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':CopilotChatStop<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pr', ':CopilotChatReset<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pe', ':CopilotChatExplain<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pr', ':CopilotChatReview<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pf', ':CopilotChatFix<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>po', ':CopilotChatOptimize<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pd', ':CopilotChatDocs<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>pt', ':CopilotChatTests<CR>', { noremap = true, silent = true })
