-- Language servers, keyed by their nvim-lspconfig name. Each entry is merged
-- into the default config shipped by nvim-lspconfig (see :h lspconfig-all).
--   requires: executable Mason needs to install the server; skipped when missing
local servers = {
  clangd = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
      },
    },
  },
  texlab = {},
  pyright = { requires = "npm" },
  bashls = { requires = "npm" },
  html = { requires = "npm", filetypes = { "html" } },
  ts_ls = { requires = "npm" },
  intelephense = {
    requires = "npm",
    init_options = { licenceKey = vim.fn.expand("~/intelephense/licence.txt") },
  },
  gopls = { requires = "go" },
  jdtls = { requires = "java" },
}

-- Servers are not started automatically: <F11> starts them for the session,
-- <F12> stops them.
local function start_servers()
  vim.lsp.enable(vim.tbl_keys(servers))
end

local function stop_servers()
  -- Disabling also stops the running clients
  vim.lsp.enable(vim.tbl_keys(servers), false)
end

-- Buffer-local keymaps and reference highlighting for attached clients
local function on_attach(event)
  local builtin = require("telescope.builtin")
  local function map(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
  end

  map("gd", builtin.lsp_definitions, "Go to definition")
  map("gr", builtin.lsp_references, "References")
  map("gI", builtin.lsp_implementations, "Go to implementation")
  map("gD", vim.lsp.buf.declaration, "Go to declaration")
  map("<leader>D", builtin.lsp_type_definitions, "Type definition")
  map("<leader>ds", builtin.lsp_document_symbols, "Document symbols")
  map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "Workspace symbols")
  map("<leader>rn", vim.lsp.buf.rename, "Rename")
  map("<leader>ca", vim.lsp.buf.code_action, "Code action")
  map("K", vim.lsp.buf.hover, "Hover")

  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client:supports_method("textDocument/documentHighlight", event.buf) then
    local group = vim.api.nvim_create_augroup("LSPHighlight", { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = event.buf })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = event.buf,
      group = group,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = event.buf,
      group = group,
      callback = vim.lsp.buf.clear_references,
    })
    vim.api.nvim_create_autocmd("LspDetach", {
      buffer = event.buf,
      group = group,
      callback = function()
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = group, buffer = event.buf })
      end,
    })
  end
end

return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",

  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
  },

  keys = {
    { "<F11>", start_servers, desc = "Start LSP servers" },
    { "<F12>", stop_servers, desc = "Stop LSP servers" },
  },

  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LSPAttach", { clear = true }),
      callback = on_attach,
    })

    -- Completion capabilities from nvim-cmp, plus folding ranges for nvim-ufo
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
    vim.lsp.config("*", { capabilities = capabilities })

    local ensure_installed = {}
    for name, server in pairs(servers) do
      local requires = server.requires
      server.requires = nil
      vim.lsp.config(name, server)

      if not requires or vim.fn.executable(requires) == 1 then
        table.insert(ensure_installed, name)
      end
    end

    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
      automatic_enable = false,
    })
  end,
}
