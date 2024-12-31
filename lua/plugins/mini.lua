return {
	'echasnovski/mini.nvim', 
	enabled = true,
	version = false,
	config = function()
		local statusline = require 'mini.statusline'
		statusline.setup { use_icons = true }
		require('mini.comment').setup()
		require('mini.align').setup()
	end
}
