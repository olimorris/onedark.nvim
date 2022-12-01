local meta = {
    name = "onedark",
    background = "dark",
}

local default_colors = {
    bg = "#282c34",
    fg = "#abb2bf",
    red = "#e06c75",
    orange = "#d19a66",
    yellow = "#e5c07b",
    green = "#98c379",
    cyan = "#56b6c2",
    blue = "#61afef",
    purple = "#c678dd",
    white = "#abb2bf",
    black = "#282c34",
    gray = "#5c6370",
    highlight = "#e2be7d",
    comment = "#7f848e",
    none = "NONE",
}

---Colors which are generated depending on the values in the palette
---@param colors table the theme's color palette
---@return table
local function generate(colors)
    local color = require("onedarkpro.lib.color")

    return {
        cursorline = colors.cursorline or "#2d313b",
        color_column = colors.color_column or "#2d313b",
        indentline = colors.indentline or color.lighten(colors.bg, 0.93),
        selection = colors.selection or "#414858",
        float_bg = colors.float_bg or color.darken(colors.bg, 0.85),

        -- Git diff
        diff_add = colors.diff_add or "#003e4a",
        diff_delete = colors.diff_delete or "#501b20",
        diff_text = colors.diff_text or "#005869",

        -- Lualine colors
        bg_statusline = colors.bg_statusline or color.darken(colors.bg, 0.85),
        fg_gutter = colors.fg_gutter or color.lighten(colors.bg, 0.90),
        fg_gutter_inactive = colors.fg_gutter_inactive or colors.fg,

        -- Virtual text
        virtual_text_error = colors.virtual_text_error or color.lighten(colors.red, 0.7),
        virtual_text_warning = colors.virtual_text_warning or color.lighten(colors.yellow, 0.7),
        virtual_text_information = colors.virtual_text_information or color.lighten(colors.blue, 0.7),
        virtual_text_hint = colors.virtual_text_hint or color.lighten(colors.cyan, 0.8),
    }
end

return {
    meta = meta,
    palette = default_colors,
    generated = function()
        return generate(default_colors)
    end,
}
