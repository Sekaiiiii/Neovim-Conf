require('packer').startup({
    function(use)
        -- packer 插件管理
        use "wbthomason/packer.nvim"

        -- nvim-tree 文件管理
        use {
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons"
        }
        require("plugin-config.nvim-tree")

        -- auto-session 会话管理
        use {'rmagatti/auto-session'}
        require("plugin-config.auto-session");

        -- lualine 底部状态栏
        use {
            'nvim-lualine/lualine.nvim',
            requires = {'nvim-tree/nvim-web-devicons', opt = true}
        }
        require("plugin-config.lualine");

        -- dashboard

        -- buffer line
        use {
            'akinsho/bufferline.nvim',
            tag = "*",
            requires = 'nvim-tree/nvim-web-devicons'
        }
        require("plugin-config.bufferline")

        -- telescope
        use {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            requires = {{'nvim-lua/plenary.nvim'}}
        }
        require("plugin-config.telescope")

        -- comment
        use {'numToStr/Comment.nvim'}
        require('plugin-config.comment')

        -- color themes
        use "savq/melange-nvim"

        -- treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            requires = {
                {"p00f/nvim-ts-rainbow"},
                {"JoosepAlviste/nvim-ts-context-commentstring"},
                {"windwp/nvim-ts-autotag"},
                {"nvim-treesitter/nvim-treesitter-refactor"},
                {"nvim-treesitter/nvim-treesitter-textobjects"}
            }
        }
        require("plugin-config.nvim-treesitter")

        -- lsp corrlation
        use {"williamboman/mason.nvim"}
        use {"williamboman/mason-lspconfig"}
        use {"neovim/nvim-lspconfig"}

        -- nvim-cmp 
        use {'hrsh7th/cmp-nvim-lsp'} -- { name = nvim_lsp }
        use {'hrsh7th/cmp-buffer'} -- { name = 'buffer' },
        use {'hrsh7th/cmp-path'} -- { name = 'path' }
        use {'hrsh7th/cmp-cmdline'} -- { name = 'cmdline' }
        use {'hrsh7th/nvim-cmp'}

        -- vsnip
        use 'hrsh7th/cmp-vsnip' -- { name = 'vsnip' }
        use 'hrsh7th/vim-vsnip'
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")
        use 'rafamadriz/friendly-snippets'

        -- -- lspkind
        use 'onsails/lspkind-nvim'

    end
})
