return {
	'echasnovski/mini.nvim',
	enabled = true,
	version = false,
	config = function()
		require('mini.comment').setup()
		require('mini.align').setup()
	end
}
