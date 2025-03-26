-- Default keymap for  the powerhouse configuration :


--vim.keymap.set("n", "<leader>dm", vim.cmd("Lazy"))
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Page navigation: ie. <leader>home moves to the page that is above the current buffer
vim.keymap.set("n", "<leader>z<Up>", "<C-w>k", { noremap = true, silent = true, desc = 'Buffer Up' }) -- Move up  
vim.keymap.set("n", "<leader>z<Left>", "<C-w>h", { noremap = true, silent = true , desc = 'Buffer Left' }) -- Move left  
vim.keymap.set("n", "<leader>z<Down>", "<C-w>j", { noremap = true, silent = true , desc = 'Buffer Down'  }) -- Move down  
vim.keymap.set("n", "<leader>z<Right>", "<C-w>l", { noremap = true, silent = true , desc = 'Buffer Right' }) -- Move right  


-- "normal! gg=G" is for default indentation
--vim.keymap.set("n", "<leader>fd", "normal! gg=G", { noremap = true, silent = true }) 
vim.keymap.set("n", "<Leader>F", function()
	local cursor_position = vim.fn.winsaveview() -- Save the cursor position
	vim.cmd(":w") -- Save the file
	vim.cmd("normal! gg=G") -- Format the entire file
	vim.fn.winrestview(cursor_position) -- Restore the cursor position
end, { noremap = true, silent = true, desc='Format Document' })


-- harpoon: Control M opens ui, ctrl+a adds file and hjkl navigates with control
local harpoon = require("harpoon")
harpoon.setup()
local keymap = vim.keymap.set

keymap("n", "<C-m>", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Harpoon UI" })
keymap("n", "<C-a>", function() require("harpoon.mark").add_file() end, { desc = "Add file to Harpoon" })

keymap("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end, { desc = "Go to Harpoon file 1" })
keymap("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end, { desc = "Go to Harpoon file 2" })
keymap("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end, { desc = "Go to Harpoon file 3" })
keymap("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end, { desc = "Go to Harpoon file 4" })


-- Generics
vim.keymap.set("n", "<leader>pv", function()
	vim.cmd("write") -- Save the current file
	vim.cmd("NvimTreeToggle") -- Open the file explorer (NvimTree)
end, { noremap = true, silent = true, desc = 'Toggle Root Tree' })
keymap("n", "<leader>pm", function() vim.cmd(":Mason") end, { desc = "Open Mason" })
keymap("n", "<leader>pl", function() vim.cmd(":Lazy") end, { desc = "Open Lazy" })




-- Fterm
vim.keymap.set('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', {desc = 'Toggle Terminal'})




-- Neogit
--vim.api.nvim_set_keymap('n', '<leader>pg', ':belowright vsplit | vertical resize 50 | Neogit kind=split<CR>', { desc= "Open Neogit" , noremap = true, silent = true })



vim.api.nvim_set_keymap('n', '<leader>pg', [[:lua ToggleNeogit()<CR>]], { desc="Open Neogit", noremap = true, silent = true })

function ToggleNeogit()
	-- Check if a Neogit buffer is already open
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		local name = vim.api.nvim_buf_get_name(buf)
		if string.match(name, "NeogitStatus") then
			vim.api.nvim_win_close(win, true) -- Close Neogit window
			return
		end
	end

	-- Create a right-side split WITHOUT duplicating the current buffer
	--vim.cmd("rightbelow vsplit")    -- Open an empty vertical split on the right
	--vim.cmd("vertical resize")   -- Resize to 50 columns
	vim.cmd("Neogit kind=split")    -- Open Neogit inside the split
end




-- Set up a keybinding to trigger codecompanion with <leader>cp
-- Accept the diff
vim.api.nvim_set_keymap('n', '<leader>cp', ':CodeCompanion<CR>', { noremap = true, silent = true })






