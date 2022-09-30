local modules_to_load = {
    'vimconfigs',
    'keymaps',
    'plugins',
    'config.treesitter',
    'config.nvimtree',
    'config.comment',
    'config.toggleterm',
    'config.telescope',
    'config.autocomplete',
    'config.telescope',
    'config.autopairs',
    'config.lsp',
    'config.blamer',
    'config.hop',
    'config.neogit'
}

local error_count = 0
for _, module in ipairs(modules_to_load) do
    local ok, _ = pcall(require, module)
    if not ok then
        if error_count == 0 then
            print('### Errors in loading modules: ') 
        end
        print('Unable to load module ' .. module)
        error_count = error_count + 1
    end
end

if error_count > 0 then
    print(' ')
end

require('onedark').setup { 
    style = 'darker',
    colors = {
        bg = '#141412',
        bg0 = '#141412',
        bg1 = '#141412',
        bg2 = '#2f2f2f',
        bg3 = '#141412',
        bg_d = '#141412'
    }
}
require('onedark').load()

vim.cmd('set runtimepath+=/home/james/Projects/vim')
