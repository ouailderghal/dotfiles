return {
    {
        "ellisonleao/gruvbox.nvim",
        cond = true,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme "gruvbox"
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        cond = true,
        opts = {
            options = {
                icons_enabled = true,
                theme = "gruvbox",
                component_separators = '|',
                section_separators = '',
            },
        },
    },
}
