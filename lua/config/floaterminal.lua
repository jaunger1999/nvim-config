local floating = {
	buf = -1,
	win = -1,
}

local function create_floating_window(opts)
	-- Set default options if not provided
	opts = opts or {}
	opts.width = opts.width or vim.o.columns * 0.8 -- 80% of screen width
	opts.height = opts.height or vim.o.lines * 0.8 -- 80% of screen height

	-- Calculate the position to center the window
	local col = math.floor((vim.o.columns - opts.width) / 2)
	local row = math.floor((vim.o.lines - opts.height) / 2)

	-- Define the configuration for the floating window
	local win_opts = {
		relative = 'editor', -- Relative to the entire editor window
		width = math.floor(opts.width),
		height = math.floor(opts.height),
		col = col,
		row = row,
		style = 'minimal', -- Make it look like a floating window
		border = 'rounded', -- You can change this to 'none', 'single', etc.
	}

	-- Open the floating window
	local buf = nil

	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true) -- Create an empty buffer
	end

	local win = vim.api.nvim_open_win(buf, true, win_opts)

	-- Optionally: Set window contents
	-- You can populate the buffer here with content, for example:
	-- vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Hello, floating window!"})

	return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("Floaterminal", function()
	if not vim.api.nvim_win_is_valid(floating.win) then
		floating = create_floating_window { buf = floating.buf }
		if vim.bo[floating.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(floating.win)
	end
end, {})
