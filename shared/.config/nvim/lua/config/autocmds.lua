-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("User", {
  pattern = "TSUpdate",
  callback = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.parsers").lox = {
      ---@diagnostic disable-next-line: missing-fields
      install_info = {
        url = "https://github.com/MarioNaise/tree-sitter-lox",
        generate = true,
        queries = "queries",
      },
    }
  end,
})
