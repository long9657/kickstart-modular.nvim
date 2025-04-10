return {
  'xiyaowong/transparent.nvim',
  opts = {
    extra_groups = {
      'NormalFloat',
      'Normal',
      'NormalNC',
      'TelescopeBorder',
      'TelescopeTitle',
      'TelescopeNormal',
      'NvimTreeNormal',
      'LualineNormal',
    },
    -- exclude_groups = {
    --   'CursorLine',
    --   'CursorLineNr',
    -- },
  },
  config = function(_, opts)
    vim.g.transparent_enabled = true
    require('transparent').setup(opts)
    require('transparent').clear_prefix 'neotree'
    require('transparent').clear_prefix 'lualine'
    require('transparent').clear_prefix 'whichkey'
  end,
}
