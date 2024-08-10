return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = false,
              compositeLiteralTypes = false,
              constantValues = true,
              functionTypeParameters = false,
              parameterNames = false,
              rangeVariableTypes = false,
            },
          },
        },
      },
      vtsls = {
        settings = {
          typescript = {
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = false },
              parameterNames = { enabled = false },
              parameterTypes = { enabled = false },
              propertyDeclarationTypes = { enabled = false },
              variableTypes = { enabled = false },
            },
          },
        },
      },
    },
  },
}
