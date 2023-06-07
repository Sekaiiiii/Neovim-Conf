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

        -- color themes
        use "savq/melange-nvim"

        -- treesitter
        use {"nvim-treesitter/nvim-treesitter"}
        require("plugin-config.nvim-treesitter")

        -- lsp corrlation
        use {"williamboman/mason.nvim"}
        use {"williamboman/mason-lspconfig"}
        use {"neovim/nvim-lspconfig"}
    end
})
