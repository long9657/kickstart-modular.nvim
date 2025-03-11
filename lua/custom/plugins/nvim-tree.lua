return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      sync_root_with_cwd = true,
      -- view = {
      --   side = 'right',
      --   signcolumn = 'no',
      -- },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { 'help' },
      },
    }
  end,
}
