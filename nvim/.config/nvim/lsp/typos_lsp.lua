return {
    cmd = { 'typos-lsp' },
    cmd_env = { RUST_LOG = "error" },
    root_markers = { 'typos.toml', '_typos.toml', '.typos.toml', 'pyproject.toml', 'Cargo.toml' },
    settings = {},
    init_options = {
        diagnosticSeverity = "Error"
    }
}
