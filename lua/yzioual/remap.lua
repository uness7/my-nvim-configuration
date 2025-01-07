vim.g.mapleader = ' '

vim.keymap.set("i", "jk", '<Esc>', {noremap = true, silent = true})
vim.keymap.set("v", "jk", '<Esc>', {noremap = true, silent = true})

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap("v", "K", ":m \'<-2<CR>gv=gv", {noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "J", ":m \'>+1<CR>gv=gv", {noremap = true, silent = true })


