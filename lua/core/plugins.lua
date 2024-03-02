local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'ellisonleao/gruvbox.nvim' -- color schema
    use 'nvim-tree/nvim-tree.lua' -- cool tree for nvim
    use 'nvim-tree/nvim-web-devicons' -- icons for nvim tree
    use 'nvim-lualine/lualine.nvim' -- power line config
    use 'nvim-treesitter/nvim-treesitter' -- syntax highlighting
    use {
        'nvim-telescope/telescope.nvim', -- for search and find files
        tag = '0.1.3',
        requires = { 
            {
                'nvim-lua/plenary.nvim'
            }
        }
    }
    use{
        'williamboman/mason.nvim', -- language server protocol
        'williamboman/mason-lspconfig.nvim', -- for configuring the mason lsp
        'neovim/nvim-lspconfig',
    }
    use 'Civitasv/cmake-tools.nvim' -- for cmake tooling
    use 'hrsh7th/nvim-cmp' -- autocompletion
    use 'hrsh7th/cmp-nvim-lsp' -- fixing autocomplition
    use 'L3MON4D3/LuaSnip' -- add snippit for autoconpletion
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets' -- for prettifying snippits
    use "akinsho/toggleterm.nvim"
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
