vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.timeoutlen = 250

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', 'kk', '_', { noremap = true })
vim.api.nvim_set_keymap('n', 'oo', 'o<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'OO', 'O<Esc>', { noremap = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('x', 'J', '<cmd>move \'>+1<CR>gv-gv', { noremap = true })
vim.api.nvim_set_keymap('x', 'K', '<cmd>move \'<-2<CR>gv-gv', { noremap = true })
vim.api.nvim_set_keymap('x', '<leader>p', '"_dP', { noremap = true })

vim.api.nvim_set_keymap('n', 'S', ':%s///g<Left><Left><Left>', { noremap = true })
vim.api.nvim_set_keymap('n', ',/', ':nohlsearch<CR>', { silent = true })

local opts = {noremap = true, silent = true}
local all_modes = {'n', 'v', 'i'}

vim.keymap.set(all_modes, '<C-w>Up', '<cmd>resize -1<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w>Down', '<cmd>resize +1<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w>Left', '<cmd>vertical resize +1<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w>Right', '<cmd>vertical resize -1<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w><C-v>', '<cmd>vsplit<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w><C-n>', '<cmd>vnew<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w><C-c>', '<cmd>close<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w><C-o>', '<cmd>only<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w><C-s>', '<cmd>split<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w><C-e>', '<cmd>e #<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-w><C-t>', '<cmd>gt<CR>', { noremap = true })

vim.keymap.set(all_modes, '<C-h>i', '<cmd>vert h<CR>', { noremap = true })

vim.keymap.set(all_modes, '<C-x><C-s>', '<cmd>wall!<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-x><C-c>', '<cmd>qall!<CR>', { noremap = true })

vim.keymap.set(all_modes, '<C-g><C-t>', '<cmd>BlamerToggle<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-g><C-b>', '<cmd>Telescope git_branches<CR>', { noremap = true })
vim.keymap.set(all_modes, '<C-g><C-n>', '<cmd>!git checkout -b ', { noremap = true })
vim.keymap.set(all_modes, '<C-g><C-g>', '<cmd>Neogit<CR>', { noremap = true })
  
vim.keymap.set(all_modes, '<C-l><C-D>', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.keymap.set(all_modes, '<C-l><C-d>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set(all_modes, '<C-l><C-i>', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.keymap.set(all_modes, '<C-l><C-r>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set(all_modes, '<C-l><C-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.keymap.set(all_modes, '<C-l><C-h>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>e #<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<cmd>bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<cmd>bprevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>;', '<cmd>!%:p<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', 'ff', '<cmd>HopWord<cr>', { noremap = true })
