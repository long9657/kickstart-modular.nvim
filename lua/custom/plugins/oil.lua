return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = {
    {
      'echasnovski/mini.icons',
      opts = {
        style = 'glyphs',
      },
    },
  },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
    require('oil').setup {
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 90,
        max_height = 0,
        -- border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<tab>'] = 'actions.select',
        ['<CR>'] = 'actions.select',
        ['<C-t>'] = { 'actions.select', opts = { tab = true } },
        ['<C-p>'] = { 'actions.preview', opts = { vertical = true, split = 'rightbelow' } },
        ['<C-c>'] = 'actions.close',
        ['R'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = { 'actions.cd', opts = { scope = 'tab' } },
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['H'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      use_default_keymaps = false,
    }

    vim.keymap.set('n', '<leader>vv', require('oil').open, { desc = 'Open parent directory' })
    vim.keymap.set('n', '<leader>e', require('oil').open_float, { desc = 'Oil float' })

    vim.keymap.set('n', '<leader>vi', function()
      local oil = require 'oil'
      local entry = oil.get_cursor_entry()
      local dir = oil.get_current_dir()

      if entry and dir then
        local full_path = vim.fn.fnamemodify(dir .. entry.name, ':p')

        local stat = vim.loop.fs_stat(full_path)

        if stat then
          vim.notify(
            vim.inspect {
              name = entry.name,
              type = entry.type,
              full_path = full_path,
              size = stat.size,
              mode = stat.mode,
              mtime = os.date('%c', stat.mtime.sec),
            },
            vim.log.levels.INFO,
            { title = 'Oil Entry Info' }
          )
        else
          vim.notify('Failed to stat file: ' .. full_path, vim.log.levels.WARN)
        end
      else
        vim.notify('No entry under cursor', vim.log.levels.WARN)
      end
    end, { desc = 'Show full file info from Oil' })
  end,
}
