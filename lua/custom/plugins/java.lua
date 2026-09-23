vim.pack.add {
  {
    src = 'https://github.com/JavaHello/spring-boot.nvim',
  },
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/mfussenegger/nvim-dap',

  'https://github.com/nvim-java/nvim-java',
}

require('java').setup()
vim.lsp.config("jdtls", {
    handlers = {
        ["$/progress"] = function(_, result, ctx) end,
    },
})
vim.lsp.enable 'jdtls'
