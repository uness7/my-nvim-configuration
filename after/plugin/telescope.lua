
local builtin = require('telescope.builtin')

-- ff stands for find general files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- ff stands for find git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

