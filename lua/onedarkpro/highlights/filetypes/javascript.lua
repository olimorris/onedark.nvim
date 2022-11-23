local M = {}

---Get the highlight groups for the filetype
---@param theme table
---@return table
function M.groups(theme)
    local config = require("onedarkpro.config").config

    return {
        ["@constructor.javascript"] = { fg = theme.palette.yellow },
        ["@keyword.javascript"] = { fg = theme.palette.purple, style = config.styles.keywords },
        ["@keyword.return.javascript"] = { fg = theme.palette.purple },
        ["@method.javascript"] = { fg = theme.palette.blue, style = config.options.bold },
        ["@method.call.javascript"] = { link = "@method.javascript" },
        ["@punctuation.bracket.javascript"] = { fg = theme.palette.yellow },
        ["@variable.javascript"] = { fg = theme.palette.red, style = config.options.italic },
        ["@variable.builtin.javascript"] = { fg = theme.palette.yellow, style = config.options.italic },
    }
end

return M
