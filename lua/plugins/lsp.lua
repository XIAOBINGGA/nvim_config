return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      rescriptls = {
        settings = {
          rescript = {
            settings = {
              incrementalTypechecking = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
