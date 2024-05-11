local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    go = { { "gofmt" } }
  },
})

vim.keymap.set({"n", "v"}, "<leader>l", function ()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end)
