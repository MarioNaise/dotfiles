return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")
    local lox = "lox"

    lint.linters.lox = {
      name = lox,
      cmd = lox,
      stdin = false,
      append_fname = true,
      args = { "lint" },
      parser = function(output)
        local ok, decoded = pcall(vim.json.decode, output)
        if not ok or type(decoded) ~= "table" then
          return {}
        end
        return decoded
      end,
    }

    lint.linters_by_ft = {
      lox = { lox },
    }

    -- auto-run on save, buffer enter & text changes
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("LoxLinting", { clear = true }),
      pattern = "*." .. lox,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
