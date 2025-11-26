return {
    cmd = { "iwes" },
    settings = {
        iwe = {
            debug = vim.env.IWE_DEBUG == "true",
            trace = "off", -- or "messages", "verbose"
        },
    },
    filetypes = { "markdown" },
    root_markers = { '.iwe' },
}
