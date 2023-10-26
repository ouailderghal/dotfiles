return {
    -- OneDark theme
    {
        'navarasu/onedark.nvim',
        cond = false,
        priority = 1000,
        config = function()
            vim.o.background = 'dark'
            vim.cmd.colorscheme 'onedark'
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        cond = false,
        opts = {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    -- Gruvbox theme
    {
        "ellisonleao/gruvbox.nvim",
        cond = false,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme "gruvbox"
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        cond = false,
        opts = {
            options = {
                icons_enabled = true,
                theme = 'gruvbox',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    -- Zenburn theme
    {
        "jnurmine/Zenburn",
        cond = true,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme "zenburn"
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        cond = true,
        opts = {
            options = {
                icons_enabled = true,
                theme = 'zenburn',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
}
