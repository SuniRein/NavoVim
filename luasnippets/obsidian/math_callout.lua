local callouts = {
    theorem = "定理",
    lemma = "引理",
    corollary = "推论",
    definition = "定义",
    proof = "证明",
    axiom = "公理",
}

local ret = {}

for callout, desc in pairs(callouts) do
    table.insert(
        ret,
        s(
            {
                trig = "!#" .. callout,
                dscr = desc,
            },
            fmt(
                [[
                    > [!{}] {}
                    > {}
                ]],
                {
                    callout,
                    i(1, desc),
                    i(0),
                }
            )
        )
    )
end

return ret
