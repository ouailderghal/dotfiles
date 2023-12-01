return {
    {
        'Tsuzat/NeoSolarized.nvim',
        cond = true,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme "NeoSolarized"
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        cond = true,
        opts = {
            options = {
                icons_enabled = true,
                theme = "solarized",
                component_separators = '|',
                section_separators = '',
            },
        },
    },
}
