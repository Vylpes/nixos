vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Plugins
    use 'dracula/vim'
    use 'ryanoasis/vim-devicons'
    -- use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use 'scrooloose/nerdtree'
    use 'preservim/nerdcommenter'
    use 'mhinz/vim-startify'
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'nvim-lua/plenary.nvim'
    use 'ThePrimeagen/harpoon'
    use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
    use 'junegunn/fzf.vim'
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'github/copilot.vim'
    use {'CopilotC-Nvim/CopilotChat.nvim', branch = 'canary'}
end)
