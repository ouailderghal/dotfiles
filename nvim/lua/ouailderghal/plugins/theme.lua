return
{
    {
        -- Themes
        -- 'ellisonleao/gruvbox.nvim',
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            vim.o.background = 'dark'
            vim.cmd.colorscheme 'onedark'
        end,
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = true,
                theme = 'onedark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
}
