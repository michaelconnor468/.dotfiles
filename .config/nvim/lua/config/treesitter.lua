local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print('Failed to procure treesitter')
    return
end

configs.setup {
    ensure_installed = 'maintained',
    sync_install = false,
    ignore_installl = {},
    highlight = {
        enable = true, -- enables whole extension
        disable = {}, -- for particular languages
    },
    additional_vim_regex_highlighting = false
}
