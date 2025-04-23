local M = {}

-- Function to create and return a horizontal terminal with consistent styling
function M.execute_horizontal_terminal(cmd)
  local Terminal = require("toggleterm.terminal").Terminal
  return Terminal:new({
    cmd = cmd,
    dir = vim.fn.getcwd(),
    direction = "horizontal",
    size = 15,
    float_opts = {
      border = "rounded",
    },
    on_open = function(term)
      -- Set better terminal UI
      vim.api.nvim_win_set_option(term.window, 'winhl', 'Normal:Normal')
      vim.api.nvim_win_set_option(term.window, 'signcolumn', 'no')
      vim.api.nvim_win_set_option(term.window, 'foldcolumn', '0')
    end,
    close_on_exit = false,
  })
end

-- Function to show notifications with consistent styling
function M.notify(message, level, title, timeout)
  require("snacks").notifier.notify(
    message,
    level or vim.log.levels.INFO,
    {
      title = title or "Notification",
      timeout = timeout or 2000,
    }
  )
end

-- Function to safely execute commands with error handling
function M.safe_execute(cmd, error_msg)
  local success, result = pcall(vim.cmd, cmd)
  if not success then
    M.notify(
      (error_msg or "Error executing command: ") .. cmd,
      vim.log.levels.ERROR,
      "Error"
    )
    return false
  end
  return true
end

return M 