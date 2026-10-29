-- Toggles between focus and zen modes using the zen-mode plugin. Window options
-- only apply to the zen window, so they are restored on close.
-- @param mode (string) The mode to toggle ("focus" or "zen")
local function toggle_zen_mode(mode)
  local options = { wrap = false, relativenumber = false }

  if mode == "focus" then
    options.number = true
  elseif mode == "zen" then
    options.number = false
    options.colorcolumn = ""
  else
    error("Invalid mode specified. Use 'focus' or 'zen'.")
  end

  require("zen-mode").toggle({
    window = {
      width = 130,
      options = options,
    },
  })
end

return {
  "folke/zen-mode.nvim",
  cond = true,
  lazy = true,

  keys = {
    {
      "<leader>zz",
      function()
        toggle_zen_mode("focus")
      end,
      mode = "n",
    },
    {
      "<leader>zZ",
      function()
        toggle_zen_mode("zen")
      end,
      mode = "n",
    },
  },
}
