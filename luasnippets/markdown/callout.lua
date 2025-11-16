local callouts = {
    "note",
    "abstract",
    "summary",
    "tldr",
    "info",
    "todo",
    "tip",
    "hint",
    "important",
    "success",
    "check",
    "done",
    "question",
    "help",
    "faq",
    "warning",
    "caution",
    "attention",
    "failure",
    "fail",
    "missing",
    "danger",
    "error",
    "bug",
    "example",
    "quote",
    "cite",
}

local ret = {}

---callout without title
for _, callout in ipairs(callouts) do
    table.insert(
        ret,
        s(
            { trig = "!" .. callout },
            fmt(
                [[
                    > [!{}]
                    > {}
                ]],
                { callout, i(0) }
            )
        )
    )
end

--- callout with title
for _, callout in ipairs(callouts) do
    table.insert(
        ret,
        s(
            { trig = "!=" .. callout },
            fmt(
                [[
                    > [!{}] {}
                    > {}
                ]],
                { callout, i(1, "TITLE"), i(0) }
            )
        )
    )
end

return ret
