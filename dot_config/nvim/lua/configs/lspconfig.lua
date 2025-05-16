require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "ruff", "pyright", 'render-markdown'}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
-- pyright

local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
local python_path = venv and (venv .. "/bin/python") or "/usr/bin/python3"

vim.lsp.config['pyright'] = {
  settings = {
    python = {
      pythonPath = python_path,
      venvPath = venv,
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

vim.lsp.config['render-markdown'] = {
  file_types = {'markdown'}
}
