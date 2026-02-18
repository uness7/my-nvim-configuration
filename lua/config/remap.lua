-- remaps

local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>pv", vim.cmd.Ex);
	vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('v', 'jk', '<Esc>', { noremap = true, silent = true })
	-- General mappings
	--vim.api.nvim_set_keymap('n', '<leader>pv', ':Vex<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader><CR>', ':so ~/.vimrc<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>fz', ':FZF<CR>', { noremap = true, silent = true })
	-- Visual mappings
	vim.api.nvim_set_keymap('v', '<leader>p', '"_dP', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
	-- Normal mode mappings
	vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>Y', 'gg"+yG', { noremap = true, silent = true })
	-- Window navigation
	vim.api.nvim_set_keymap('n', '<leader>ll', '<C-w>l', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>hh', '<C-w>h', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>kk', '<C-w>k', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>jj', '<C-w>j', { noremap = true, silent = true })
	-- Switch between buffers
	vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>p', ':bprevious<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>d', ':bdelete<CR>', { noremap = true, silent = true })
	-- keep cursor in the middle when search for keywords
	vim.keymap.set("n", "n", "nzzzv");
	vim.keymap.set("n", "N", "Nzzzv");

	-- copy to system's clipboard
	vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

	-- paste from the system's clipboard
	vim.api.nvim_set_keymap('n', '<leader>pp', '"+p', { noremap = true, silent = true })

	-- tabs controls
	vim.api.nvim_set_keymap('n', '<C-Left>', ':tabprevious<CR>', { noremap = true, silent = true } )
	vim.api.nvim_set_keymap('n', '<C-Right>', ':tabnext<CR>', { noremap = true, silent = true } )

end
return M

