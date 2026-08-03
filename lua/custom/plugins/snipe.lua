local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { gh 'leath-dub/snipe.nvim' }
local snipe = require 'snipe'
snipe.setup {
  ui = {
    --- --- @type "topleft" | "bottomleft" | "topright" | "bottomright" | "center" | "cursor"
    --- position = 'center',
    preselect_current = true,
    text_align = 'file-first',
  },
  hints = {
    ---@type string
    dictionary = 'asdfwecmpghio',
  },
  navigate = {
    under_cursor = 'l',
    cancel_snipe = { '<esc>', 'q' },
    open_split = 'S',
  },
  sort = 'first',
}
vim.keymap.set('n', '<Space><Space>', snipe.open_buffer_menu)
