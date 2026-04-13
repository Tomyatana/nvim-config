-- Telescope
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', telescope.find_files, {})
vim.keymap.set('n', '<leader>pg', telescope.git_files, {})
vim.keymap.set('n', '<leader>vkh', telescope.keymaps, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fw', telescope.live_grep, {})

-- Personal

vim.keymap.set("n", "<leader>,", function ()
    local line = vim.api.nvim_get_current_line()
    if line:sub(-1) == ';' then
        line = line:sub(1, -2)
        else
            line = line .. ';'
        end
    vim.api.nvim_set_current_line(line)
end, {desc="Toggles a `;` at the end of the line"})

vim.keymap.set('n', '<cr>', '<cmd>let @/ = ""<cr>', {silent=true, desc="Clears search query"})

-- Harpoon
local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set('n', "<leader>ha", function()
	harpoon:list():add()
	print("Added buffer to harpoon list")
end, {desc="Adds buffer to harpoon list"})
vim.keymap.set('n', "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc="Displays harpoon's quick menu"})
vim.keymap.set('n', "<C-h>", function()
	harpoon:list():clear()
	print("Cleared harpoon list")
end, {desc="Clears harpoon list"})

vim.keymap.set('n', "<leader>h1", function() harpoon:list():select(1) end, {desc="Selects harpoon entry 1"})
vim.keymap.set('n', "<leader>h2", function() harpoon:list():select(2) end, {desc="Selects harpoon entry 2"})
vim.keymap.set('n', "<leader>h3", function() harpoon:list():select(3) end, {desc="Selects harpoon entry 3"})
vim.keymap.set('n', "<leader>h4", function() harpoon:list():select(4) end, {desc="Selects harpoon entry 4"})
vim.keymap.set('n', "<leader>h4", function() harpoon:list():select(4) end, {desc="Selects harpoon entry 5"})

vim.keymap.set('n', "<leader>hn", function() harpoon:list():next() end, {desc="Switches to next buffer in harpoon list"})
vim.keymap.set('n', "<leader>hb", function() harpoon:list():prev() end, {desc="Switches to previous buffer in harpoon list"})
