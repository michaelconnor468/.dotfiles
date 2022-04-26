local ok, _ = pcall(require, 'lspconfig')
if not ok then
    print('Could not procure lspconfig')
    return
end

require('config.lsp.lsp-installer')
require('config.lsp.handlers').setup()
