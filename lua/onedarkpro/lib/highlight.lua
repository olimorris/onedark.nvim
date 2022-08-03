local M = {}

---Validate the value from the opts table
---@param input string
---@return string
local function validate(input)
    return input and input or "NONE"
end

---Validate the link from the opts table
---@param link string
---@return boolean
local function valid_link(link)
    return link and link ~= ""
end

local function parse_style(style)
    if not style or style == "NONE" then
        return {}
    end

    local result = {}
    for token in string.gmatch(style, "([^,]+)") do
        result[token] = true
    end

    return result
end

---Create highlights the new Neovim way
---@param highlights table
---@return nil
local function neovim_hl(highlights)
    for group, opts in pairs(highlights) do
        if valid_link(opts.link) then
            vim.api.nvim_set_hl(0, group, {
                link = opts.link,
            })
        else
            local values = parse_style(opts.style)
            values.fg = opts.fg
            values.bg = opts.bg
            values.sp = opts.sp
            vim.api.nvim_set_hl(0, group, values)
        end
    end
end

---Create highlights the old school vim way
---@param highlights table
---@return nil
local function vim_hl(highlights)
    for group, opts in pairs(highlights) do
        if valid_link(opts.link) then
            vim.cmd(string.format("highlight! link %s %s", group, opts.link))
        else
            vim.cmd(
                string.format(
                    "highlight %s guifg=%s guibg=%s gui=%s guisp=%s",
                    group,
                    validate(opts.fg),
                    validate(opts.bg),
                    validate(opts.style),
                    validate(opts.sp)
                )
            )
        end
    end
end

---Create the given highlight groups
---@param highlights table
---@return nil
function M.create(highlights)
    local utils = require("onedarkpro.utils")

    if utils.use_nvim_api then
        return neovim_hl(highlights)
    end

    return vim_hl(highlights)
end

return M
