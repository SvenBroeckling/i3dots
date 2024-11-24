function copy_visual_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local lines = vim.fn.getline(start_pos[2], end_pos[2])
	lines[1] = string.sub(lines[1], start_pos[3])
	lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
	local content = table.concat(lines, "\n")

	vim.fn.setreg("+", content)
	print("Copied to clipboard")
end

local function set_wrap()
	vim.opt.wrap = true
	vim.opt.linebreak = true
	vim.keymap.set('n', 'j', 'gj')
	vim.keymap.set('n', 'k', 'gk')
end

local function set_nowrap()
	vim.opt.wrap = false
	vim.opt.linebreak = false
	vim.keymap.set('n', 'j', 'j')
	vim.keymap.set('n', 'k', 'k')
end

vim.keymap.set('v', '>', '>gv', { noremap = true })                                                            -- Keep selection after indenting
vim.keymap.set('v', '<', '<gv', { noremap = true })                                                            -- Keep selection after unindenting

vim.keymap.set('n', 'Y', 'yy')                                                                                 -- Yank (copy) the current line (old behavior)
vim.api.nvim_set_keymap("v", "<C-c>", [[:lua copy_visual_selection()<CR>]], { noremap = true, silent = true }) -- Copy visual selection to system clipboard
vim.api.nvim_set_keymap("n", "<C-c>", [[:lua vim.fn.setreg('+', vim.fn.getline('.'))<CR>]],
	{ noremap = true, silent = true })                                                                         -- Copy current line to system clipboard

vim.keymap.set('n', '<leader>w', set_wrap)
vim.keymap.set('n', '<leader>W', set_nowrap)

vim.keymap.set("n", "<leader>ge", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>gE", vim.diagnostic.goto_prev)

-- codeium
vim.keymap.set('i', '<C-J>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
	{ expr = true, silent = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
	{ expr = true, silent = true })
vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

-- oil

vim.keymap.set('n', '<leader>o', ':Oil<CR>', { silent = true })
vim.keymap.set('n', '<leader>O', ':Oil --float<CR>', { silent = true })
