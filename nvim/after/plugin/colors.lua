local theme = "zenburn"
local status, _ = pcall(vim.cmd, string.format("colorscheme %s", theme))

if not status then
  print(string.format("Colorscheme %s not found.", theme))
  return
end
