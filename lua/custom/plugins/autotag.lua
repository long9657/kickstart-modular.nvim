local function gh(repo) return "https://github.com/" .. repo end
vim.pack.add { gh "windwp/nvim-ts-autotag" }
require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false,
  },
})
