local function gh(repo) return "https://github.com/" .. repo end
vim.pack.add {
  gh "folke/tokyonight.nvim",
  gh "catppuccin/nvim",
  gh "scottmckendry/cyberdream.nvim",
  gh "craftzdog/solarized-osaka.nvim"
}

require("cyberdream").setup {
  italic_comments = true,
  hide_fillchars = false,
  borderless_telescope = true,
  terminal_colors = true,
}

local themes = {
  "tokyonight-night",
  "solarized-osaka",
  "catppuccin",
  "cyberdream",
}
local current_theme_index = 1
vim.cmd.colorscheme(themes[current_theme_index])

vim.keymap.set("n", "<leader>nt", function()
  current_theme_index = current_theme_index + 1
  if current_theme_index > #themes then
    current_theme_index = 1
  end
  local theme = themes[current_theme_index]
  vim.cmd.colorscheme(theme)
  print("Change nvim theme to: " .. theme)
end, { desc = "Change Nvim Theme", noremap = true, silent = true })
