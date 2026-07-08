local function gh(repo) return "https://github.com/" .. repo end
vim.pack.add { gh "rmagatti/auto-session" }
require("auto-session").setup({
  cwd_change_handling = true,
  auto_restore_last_session = false,
  suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  bypass_save_filetypes = { "", "no-neck-pain", "neo-tree", "noice", "notify" },
  pre_save_cmds = {
    function()
      local cwd = vim.uv.cwd()
      local bufs = vim.api.nvim_list_bufs()

      if not cwd then return end
      for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local name = vim.api.nvim_buf_get_name(buf)
          if name ~= "" and not name:find(cwd, 1, true) then
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      end
    end,
  },
})
vim.keymap.set("n", "<leader>wr", "<cmd>AutoSession search<CR>", { desc = "Session search" })
vim.keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>", { desc = "Save session" })
vim.keymap.set("n", "<leader>wa", "<cmd>AutoSession toggle<CR>", { desc = "Toggle autosave" })
