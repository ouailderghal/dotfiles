return {
    {
        "navarasu/onedark.nvim",
        priority = 1000 ,
        lazy = false,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme "onedark"
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        cond = true,
        opts = {
            options = {
                icons_enabled = true,
                theme = "onedark",
                component_separators = '|',
                section_separators = '',
            },
        },
    },
}
