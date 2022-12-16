local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    print('Failed to procure treesitter')
    return
end

configs.setup {
    ensure_installed = 'all',
    sync_install = false,
    ignore_installl = {},
    highlight = {
        enable = true, -- enables whole extension
        disable = {}, -- for particular languages
    },
    additional_vim_regex_highlighting = false
}
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    disable = function(lang, buf)
        local max_filesize = 1000 * 1024 -- 1 MiB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}
