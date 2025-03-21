return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'oceanicnext',
      section_separators = '',
      component_separators = '',
      disabled_filetypes = { 'neo-tree' },
    },
    sections = {
      lualine_z = {
        {
          'datetime',
          -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
          style = 'default',
        },
      },
    },
  },
}
