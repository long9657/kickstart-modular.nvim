local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Colorscheme ]]
-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
vim.pack.add { gh 'folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
-- vim.cmd.colorscheme 'tokyonight-night'

local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add {
  gh 'catppuccin/nvim',
  gh 'scottmckendry/cyberdream.nvim',
  gh 'craftzdog/solarized-osaka.nvim',
}

require('cyberdream').setup {
  italic_comments = true,
  hide_fillchars = false,
  borderless_telescope = true,
  terminal_colors = true,
}

local themes = {
  'tokyonight-night',
  'solarized-osaka',
  'catppuccin',
  'cyberdream',
}
local current_theme_index = 1
vim.cmd.colorscheme(themes[current_theme_index])

vim.keymap.set('n', '<leader>nt', function()
  current_theme_index = current_theme_index + 1
  if current_theme_index > #themes then current_theme_index = 1 end
  local theme = themes[current_theme_index]
  vim.cmd.colorscheme(theme)
  print('Change nvim theme to: ' .. theme)
end, { desc = 'Change Nvim Theme', noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
