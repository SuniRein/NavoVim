local M = {}

function M.add_source(opts, name, provider)
    opts.sources = opts.sources or {}

    opts.sources.default = opts.sources.default or {}
    table.insert(opts.sources.default, name)

    opts.sources.providers = opts.sources.providers or {}
    opts.sources.providers[name] = provider
end

return M
