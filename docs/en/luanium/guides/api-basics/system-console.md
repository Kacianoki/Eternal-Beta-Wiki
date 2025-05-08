# `system_console`
`system_console` offers console functionality:

```lua
Include("system_console")

console.println("Hello world!")

console.print("Write your name: ")
local name = console:readln()

console.println("Your name is " .. name .. "!")
```

For example, this is how a simple calculator would look like:

```lua
Include("system_console")

local case = {
    ["+"] = function (fnum, snum)
        return fnum + snum
    end,
    ["-"] = function (fnum, snum)
        return fnum - snum
    end,
    ["/"] = function (fnum, snum)
        return fnum / snum
    end,
    ["*"] = function (fnum, snum)
        return fnum * snum
    end
}

while true do
    console:print("First num: ")
    local fnum = tonumber(console:readln())
    
    console:print("Operator: ")
    local operator = console:readln()

    console:print("Second num: ")
    local snum = tonumber(console:readln())

    console:println(case[operator](fnum, snum))
end
```