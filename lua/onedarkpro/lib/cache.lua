local config = require("onedarkpro.config")
local file = require("onedarkpro.utils.file")

local M = {}

---Cache the compiled theme to disk
---@param opts table Should contain the theme
---@return nil|function
function M.write(opts)
    local cache_path, cache_file = config.get_cached_info(opts)

    file.ensure_dir(cache_path)
    local f = file.write(cache_file, require("onedarkpro").compiled)

    if not f then error("Could not write to cache file for " .. opts.theme) end
end

---Clean the given file from disk
---@param opts table
---@return nil
function M.clean(opts)
    local cache_path, cache_file = config.get_cached_info(opts)

    if opts.file then
        os.remove(file.join_paths(cache_path, opts.file))
        return
    end

    os.remove(cache_file)
end

return M
