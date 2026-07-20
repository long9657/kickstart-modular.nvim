local function gh(repo) return "https://github.com/" .. repo end
vim.pack.add { gh "otavioschwanck/arrow.nvim" }
require("arrow").setup({
  show_icons = true,
  leader_key = ";",
  buffer_leader_key = "m",
  window = {
    border = 'rounded'
  }
})
