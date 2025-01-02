require("config.lazy")
require("config.floaterminal")

-- custom keybinds
vim.keymap.set({ "n", "v" }, "<F5>", "<cmd>update<Enter>")
vim.keymap.set({ "n", "v" }, "<F6>", "<cmd>tabp<Enter>")
vim.keymap.set({ "n", "v" }, "<F7>", "<cmd>tabn<Enter>")

-- formatting preferences
vim.o.expandtab  = false
vim.o.tabstop    = 3
vim.o.shiftwidth = 3

vim.keymap.set('n', '<leader>F',
	function()
		vim.lsp.buf.format {}
	end
)

-- code folding
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd("BufEnter", { command = "normal zR" })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>ft', '<cmd>Floaterminal<Enter>', { desc = 'Open floating terminal' })

vim.keymap.set('n', 'gr', vim.lsp.buf.rename, { desc = 'Rename symbol' })

if vim.fn.has('win32') == 1 then
	vim.o.shell = "powershell"
end
