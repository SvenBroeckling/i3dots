local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset("recommended")

lsp.ensure_installed({
  'eslint',
  'emmet_ls',
  'rust_analyzer',
  'pyright',
  'dockerls',
  'docker_compose_language_service',
  'html',
  'jsonls',
  'lua_ls',
  'cssls',
  'bashls',
  'ansiblels',
})

lsp.on_attach(function(client, bufnr)
  --  lsp.default_keymaps({buffer = bufnr})
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- language servers setup

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.pyright.setup {
  settings = {
    python = {
      analysis = {
        -- Disable type checking of django's dynamically created attributes
        typeCheckingMode = "off", -- Can be "basic" or "off" (depending on how strict you want)

        -- Specify the paths to extra type stubs (django-stubs help with django-specific monkey patching)
        stubPath = "typings",

        -- Define which files to include in analysis
        autoSearchPaths = true,

        -- Use Django as the project environment
        useLibraryCodeForTypes = true,

        -- Disable reporting of missing imports (especially useful when django models or views dynamically import related models)
        reportMissingImports = false,

        -- Disable reportUnboundVariable which is often incorrectly triggered due to dynamic model properties
        reportUnboundVariable = false,

        -- Disable specific errors related to untyped variables (common in dynamically constructed attributes)
        reportUnknownMemberType = false,
        reportGeneralTypeIssues = false,
      }
    }
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "htmldjango" },
  init_options = {
    htmldjang = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

lsp.setup()
