return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      zls = {
        settings = {
          enable_build_on_save = true,
        },
      },
    },
  },
}
