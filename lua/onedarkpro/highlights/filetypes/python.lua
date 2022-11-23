local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constructor.python"] = { fg = theme.palette.cyan, style = config.options.bold },
        ["@conditional.python"] = { fg = theme.palette.purple, style = config.options.italic },
        ["@method.call.python"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@variable.builtin.python"] = { fg = theme.palette.yellow, style = config.options.italic },
    }
end

return M
