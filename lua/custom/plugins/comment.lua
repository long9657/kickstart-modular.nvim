if vim.fn.has "nvim-0.10.0" == 1 then
  local function gh(repo) return "https://github.com/" .. repo end
  vim.pack.add { gh "folke/ts-comments.nvim" }
  require("ts-comments").setup({})
end
