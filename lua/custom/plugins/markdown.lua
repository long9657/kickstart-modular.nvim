local function gh(repo) return "https://github.com/" .. repo end
vim.pack.add { gh "MeanderingProgrammer/render-markdown.nvim" }
require("render-markdown").setup({
  line_breaks = true,
})
