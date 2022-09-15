require('vimconfigs')
require('keymaps')
require('plugins')
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

require('config.treesitter')
require('config.nvimtree')
require('config.comment')
require('config.toggleterm')
require('config.telescope')
require('config.autocomplete')
require('config.telescope')
require('config.autopairs')
require('config.lsp')
require('config.blamer')
require('config.hop')
require('config.neogit')

vim.cmd('set runtimepath+=/home/james/Projects/vim')
