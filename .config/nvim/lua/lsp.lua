local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_attach = function()
  local nmap = function(key, func)
    vim.keymap.set("n", key, func, { buffer = 0 })
  end
  nmap("<leader>sd", vim.lsp.buf.hover)
  nmap("gD", vim.lsp.buf.declaration)
  nmap("gd", vim.lsp.buf.definition) -- <C-t> to jump back.
  nmap("gr", vim.lsp.buf.references)
  nmap("gt", vim.lsp.buf.type_definition)
  nmap("gi", vim.lsp.buf.implementation)
  nmap("<leader>df", vim.diagnostic.goto_next)
  nmap("<leader>db", vim.diagnostic.goto_prev)
  nmap("<leader>.", vim.lsp.buf.code_action)
  vim.keymap.set("n", "<leader>rn", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { expr = true })
end

local setup_lsp = function(name, args)
  args.capabilities = capabilities
  args.on_attach = lsp_attach
  require("lspconfig")[name].setup(args)
end

setup_lsp("bashls", {})
setup_lsp("bzl", {})
setup_lsp("clangd", {})
setup_lsp("cmake", {})
setup_lsp("cssls", {})
setup_lsp("dhall_lsp_server", {})
setup_lsp("html", {})
setup_lsp("hls", {})
setup_lsp("tsserver", {})
setup_lsp("lua_ls", {})
setup_lsp("rnix", {})
setup_lsp("sqlls", {})
setup_lsp("rust_analyzer", {})
setup_lsp("terraformls", {})
setup_lsp("yamlls", {})
