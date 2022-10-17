local M = {}

local override = {}
local caching = false

function override.colors(colors)
    require("onedarkpro.override").colors = colors
end

function override.highlights(highlights)
    require("onedarkpro.override").highlights = highlights
end

function override.ft_highlights(highlights)
    require("onedarkpro.override").ft_highlights = highlights
end

M.override = override

---Setup the theme via the default config or the users own
---@param opts table  User's config
---@return nil
function M.setup(opts)
    opts = opts or {}

    local logger = require("onedarkpro.utils.logging")
    local config = require("onedarkpro.config")

    config.setup(opts)
    logger:set_level(config.config.log_level)
    logger.debug("Setting configuration")

    if opts.caching then
        caching = true
    end

    if opts.colors then
        logger.debug("Overriding colors")
        override.colors(opts.colors)
    end

    if opts.highlights then
        logger.debug("Overriding highlight groups")
        override.highlights(opts.highlights)
    end

    if opts.ft_highlights then
        logger.debug("Setting old filetype highlights")
        override.ft_highlights(opts.ft_highlights)
    end

    logger.debug("Configuration set:", config.config)

    require("onedarkpro.lib.deprecate").check(opts)
end

local highlight = {}

function highlight.editor(editor)
    require("onedarkpro.highlight").editor = editor
end

function highlight.syntax(syntax)
    require("onedarkpro.highlight").syntax = syntax
end

function highlight.filetypes(filetypes)
    require("onedarkpro.highlight").filetypes = filetypes
end

function highlight.plugins(plugins)
    require("onedarkpro.highlight").plugins = plugins
end

function highlight.apply(highlights, theme)
    return require("onedarkpro.utils.variable").replace_vars(
        vim.deepcopy(highlights),
        require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated)
    )
end

function highlight.custom(highlights)
    require("onedarkpro.highlight").custom = highlights
end

function highlight.ft(highlights)
    require("onedarkpro.highlight").ft = highlights
end

M.highlight = highlight

---Load the theme
---@param cache_loaded? boolean  a flag for if theme was loaded from the cache
---@return nil
function M.load(cache_loaded)
    local theme = require("onedarkpro.theme").load()
    local cache = require("onedarkpro.lib.cache")
    local logger = require("onedarkpro.utils.logging")
    local override_mod = require("onedarkpro.override")

    logger:set_level(require("onedarkpro.config").config.log_level)
    logger.debug("Begin theme load:", theme)

    if caching and cache.exists(theme.meta.name) and not cache_loaded then
        local ok, loaded_cache = pcall(cache.load, theme)
        if ok then
            logger.debug("CACHE: Completed load")
            return loaded_cache
        end

        logger.debug("CACHE: Could not be loaded", loaded_cache)
        vim.notify("[OneDarkPro.nvim] Could not load from cache. It might be corrupted", vim.log.levels.WARN)
    end

    highlight.editor(require("onedarkpro.highlights.editor").groups(theme))
    highlight.syntax(require("onedarkpro.highlights.syntax").groups(theme))
    highlight.filetypes(require("onedarkpro.highlights.filetype").groups(theme))
    highlight.plugins(require("onedarkpro.highlights.plugin").groups(theme))

    if override_mod.highlights then
        highlight.custom(highlight.apply(override_mod.highlights, theme))
    end

    if override_mod.ft_highlights then
        highlight.ft(highlight.apply(override_mod.ft_highlights, theme))
    end

    require("onedarkpro.main").load(theme)

    -- If a user has set caching to be true but doesn't yet have a cache file, create one
    if caching and not cache.exists(theme.meta.name) then
        logger.debug("CACHE: Automatically create the cache file")
        return cache.generate()
    end
end

---Get the color palette for a specific theme
---@param theme_name string
---@return table
function M.get_colors(theme_name)
    if vim.g.onedarkpro_colors then
        return vim.g.onedarkpro_colors
    end

    local theme = require("onedarkpro.theme").load(theme_name)
    return require("onedarkpro.utils.collect").deep_extend(theme.palette, theme.generated, theme.meta)
end

---Cache a user's config
---@return nil
function M.cache()
    require("onedarkpro.lib.cache").generate()
    return vim.notify("[OneDarkPro] Cache generated!")
end

---Delete a user's cache
---@return nil
function M.clean()
    require("onedarkpro.lib.cache").clean()
    return vim.notify("[OneDarkPro] Cache cleaned!")
end

return M
