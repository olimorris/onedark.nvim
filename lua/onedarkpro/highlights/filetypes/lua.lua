local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").init()

    return {
        ["@comment.lua"] = { fg = theme.palette.gray, style = config.options.italic },
        ["@function.builtin.lua"] = { fg = theme.palette.cyan, style = config.options.bold },
        ["@function.call.lua"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@field.lua"] = { fg = theme.palette.fg },
        ["@keyword.lua"] = { fg = theme.palette.purple },
        ["@keyword.operator.lua"] = { fg = theme.palette.fg },
        ["@method.lua"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@operator.lua"] = { fg = theme.palette.fg },
        ["@parameter.lua"] = { fg = theme.palette.fg, style = config.options.italic },
        ["@punctuation.bracket.lua"] = { fg = theme.palette.orange },
    }
end

return M
