local function gh(repo) return "https://github.com/" .. repo end
vim.pack.add { gh "mbbill/undotree" }

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>uf", vim.cmd.UndotreeFocus)
