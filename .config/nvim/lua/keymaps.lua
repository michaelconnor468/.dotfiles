vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', ',/', ':nohlsearch<CR>', { silent = true })
vim.api.nvim_set_keymap('n', 'ff', ':! ', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', { noremap = true })
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -1<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':bprevious<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<cr>', { noremap = true })
