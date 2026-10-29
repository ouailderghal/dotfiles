return {
    "lervag/vimtex",
    lazy = false,
    config = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            out_dir = "out",
            options = {
                "-pdf",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
        vim.g.vimtex_mappings_enabled = true
        vim.g.vimtex_quickfix_mode = 2

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("VimtexKeymaps", { clear = true }),
            pattern = "tex",
            callback = function(event)
                vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { buffer = event.buf, silent = true })
            end,
        })
    end,
}
