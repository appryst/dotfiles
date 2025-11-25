local state = {
  floating = {
    buf = -1,
    win = -1,
    last_mode = "t",  -- "t" for terminal/insert mode, "n" for normal mode
    last_pos = {0, 0} -- {row, col}
  }
}

local function create_floating_window(opts)
  opts = opts or {}
  local width = opts.width or math.floor(vim.o.columns * 0.6)
  local height = opts.height or math.floor(vim.o.lines * 0.4)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- scratch buffer
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)
  return { buf = buf, win = win }
end

-- Set up autocommands to track terminal mode and cursor position
local function setup_terminal_autocmds(buf)
  -- Track mode changes inside the terminal buffer
  vim.api.nvim_create_autocmd({"TermEnter", "TermLeave"}, {
    buffer = buf,
    callback = function()
      -- "t" = terminal/insert mode; "n" = normal mode
      state.floating.last_mode = vim.fn.mode()
    end
  })

  -- Track cursor position
  vim.api.nvim_create_autocmd({"CursorMoved", "CursorMovedI"}, {
    buffer = buf,
    callback = function()
      state.floating.last_pos = vim.api.nvim_win_get_cursor(0)
    end
  })
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    -- Create the floating window
    state.floating = vim.tbl_extend("force", state.floating, create_floating_window { buf = state.floating.buf })

    -- If the buffer is not already a terminal, start a terminal
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
      setup_terminal_autocmds(state.floating.buf)
    end

    -- Focus the new window
    vim.api.nvim_set_current_win(state.floating.win)

    -- Restore cursor position
    if state.floating.last_pos then
      pcall(vim.api.nvim_win_set_cursor, state.floating.win, state.floating.last_pos)
    end

    -- Restore last mode
    if state.floating.last_mode == "t" then
      vim.cmd("startinsert")
    else
      vim.cmd("stopinsert")
    end

  else
    -- Hide the window but keep the buffer
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({"n", "t"}, "<leader>tt", toggle_terminal)

