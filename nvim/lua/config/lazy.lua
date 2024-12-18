local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.ai.copilot" },
    { import = "lazyvim.plugins.extras.ui.dashboard-nvim" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.linting.eslint" },

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.cmd("set nrformats+=alpha")

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi DashboardHeader guifg=#ff9e64")
vim.cmd("hi DashboardKey guifg=#957fb8")
vim.cmd("hi DashboardDesc guifg=#c8c093")

-- go
vim.api.nvim_set_hl(0, "@lsp.type.keyword.go", {})
vim.api.nvim_set_hl(0, "@lsp.type.type.go", {})

-- ts/js
vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.typescript", {})
vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.typescript", {})

vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.typescriptreact", {})
vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.typescriptreact", {})

vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.javascript", {})
vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.javascript", {})

vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.javascriptreact", {})
vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.javascriptreact", {})

-- turns off all LSP highlights
-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--   vim.api.nvim_set_hl(0, group, {})
-- end
