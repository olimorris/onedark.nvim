local hex = function(n)
    if n then return string.format("#%06x", n) end
end

describe("Using the theme", function()
    before_each(function()
        vim.cmd(":e tests/stubs/test.txt")
        vim.o.background = "dark"
    end)

    after_each(function()
        -- This is essential to make sure that config changes are properly applied
        require("onedarkpro").clean()
    end)

    it("it should link highlight groups together", function()
        local output = vim.api.nvim_get_hl_by_name("NormalFloat", true)
        assert.equals(hex(output.foreground), "#abb2bf")
        assert.equals(hex(output.background), "#333841")
    end)

    it("it should also apply blends", function()
        local output = vim.api.nvim_get_hl_by_name("ModeMsg", true)
        assert.equals(hex(output.blend), "#000064")
    end)
end)
