local utils = require("utils.luasnip")

local function surround(trigger, dscr, text)
    return s(
        {
            trig = trigger,
            dscr = dscr,
            snippetType = "autosnippet",
        },
        fmta(text .. "<>" .. text, {
            d(1, utils.get_visual),
        })
    )
end

return {
    surround(";b", "Bold text", "**"),
    surround(";i", "Italic text", "*"),
    surround(";I", "Blod Italic text", "***"),
    surround(";h", "Highlight block", "=="),
    surround(";c", "Code block (inline)", "`"),
    surround(";m", "Math block", "$"),
    s(
        {
            trig = ";l",
            dscr = "Link",
            snippetType = "autosnippet",
        },
        fmta("[<>](<>)", {
            d(1, utils.get_visual),
            i(2, "https://example.com"),
        })
    ),
    s(
        {
            trig = ";C",
            dscr = "Code block (block)",
            snippetType = "autosnippet",
        },
        fmt(
            [[
                ```{}
                {}
                ```
            ]],
            {
                i(1, "lang"),
                d(2, utils.get_visual),
            }
        )
    ),
}
