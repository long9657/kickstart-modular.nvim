--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- Settings
  vim.o.guifont = 'Comic Code:h16' -- text below applies for VimScript
  vim.g.neovide_fullscreen = true
  vim.g.neovide_window_blurred = true
  vim.g.neovide_opacity = 0.6
  vim.g.neovide_cursor_animate_in_insert_mode = false

  -- Keymaps
  vim.keymap.set('n', '<C-S-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

  -- Scaling changes
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta) vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta end
  vim.keymap.set('n', '<C-=>', function() change_scale_factor(1.25) end)
  vim.keymap.set('n', '<C-->', function() change_scale_factor(1 / 1.25) end)
end

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Set up vim.pack ]]
require 'pack'

-- [[ Configure and install plugins ]]
require 'plugins'

-- [[ Floating terminal ]]
require 'floating-term'

--[[ Help-floating ]]
require 'help-floating'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
