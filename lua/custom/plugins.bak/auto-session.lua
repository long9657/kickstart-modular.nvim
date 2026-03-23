return {
  'rmagatti/auto-session',
  lazy = false,
  -- enabled = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>wr', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>ws', '<cmd>AutoSession save<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>AutoSession toggle<CR>', desc = 'Toggle autosave' },
  },
  opts = {
    (function() vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions' end)(),
    cwd_change_handling = true,
    auto_restore_last_session = false,
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    bypass_save_filetypes = {
      '',
      'no-neck-pain',
      'neo-tree',
      'noice',
      'notify',
    },
    pre_save_cmds = {
      function()
        local cwd = vim.uv.cwd()
        local bufs = vim.api.nvim_list_bufs()

        if not cwd then return end
        for _, buf in ipairs(bufs) do
          if vim.api.nvim_buf_is_loaded(buf) then
            local name = vim.api.nvim_buf_get_name(buf)
            if name ~= '' and not name:find(cwd, 1, true) then
              -- buffer has a name and is not under cwd, close it
              vim.api.nvim_buf_delete(buf, { force = true })
            end
          end
        end
      end,
    },
  },
}
