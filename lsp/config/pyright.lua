return {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}
