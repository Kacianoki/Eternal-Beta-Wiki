# Introduction to ELua
In this guide you will learn about the major differences between Elua and regular Lua and acquire some basic knowledge, which will help you learn to use the main libraries.

## Major changes
There are no libraries like `os`, `env` in Elua, and there is no `require` keyword. Other libraries and functions 
are used as a substitute instead.

## Basic terms
Firstly, you need to learn about a new term, that you will see very often further in the guide:

### Namespace
Namespace - a cointainer for logical grouping of code. It can contain variables and functions. Its
purpose is reusability of the code: it allows you to use those functions and variables in many different scripts.

Suppose, we are writing a calculator:

`sum.lua`
```lua
function sum(x, y)
    return x + y
end
```

`div.lua`
```lua
function divide(a, b)
    if b == 0 then
        error("division by zero")
    end
    return a / b
end
```

`calc.lua`
```lua
function calc(fnum, snum, operator)
    if operator == "/" then
        return divide(fnum, snum)
    else if operator == "+" then
        return sum(fnum, snum)
    end
end
```

`calc.lua` cannot call `#!lua divide()` and `#!lua sum()`, because they are not declared in `calc.lua`. Instead of 
copying the contents of `div.lua` and `sum.lua` into `calc.lua`, we can use the namespaces:

`#!lua Namespace()` -- This function adds the current script file to the specified namespace.

`sum.lua`
```lua
Namespace("calculator") -- Adding the contents of the file to the namespace "calculator"
function sum(x, y)
    return x + y
end
```

`div.lua`
```lua
Namespace("calculator") -- Same namespace
function divide(a, b)
    if b == 0 then
        error("Error: division by zero!")
    end
    return a / b
end
```

Now the scripts, which do the computing, are contained in a namespace. In order to use that namespace, we need to update
`calc.lua` by adding a new function call: `#!lua Include()`:

`calc.lua`
```lua
Include("calculator") -- Importing all contents of namespace "calculator" to the current file

function calc(fnum, snum, operator)
    if operator == "/" then
        return divide(fnum, snum)
    else if operator == "+" then
        return sum(fnum, snum)
    end
end
```

## Disk indexing
Each disk has its own index.
A disk, from which the game runs init script (such disks are called loading disks), is always going to have `0` as 
its index.

## `#!lua Include()` function
### File importing
`#!lua Include()` function can import .lua files directly:
```lua
Include("0:/some-lua-file.lua")
```
Here the disk index, that we are reading the file from, is specified before the column, and the full path to the lua file
is specified after the column. 

## Execution context
All scripts written in lua are executed in "execution contexts" (I haven't come up with a better name). Now I'll explain
what it means:

Each `#!lua Include()` function call imports the contents of the namespace not to a file, but to an "execution context",
meaning that if you imported something to one file, then it will be automatically imported to the rest of the files of 
that context:

`first.lua`
```lua
Include("calculator") -- added to some execution context
Include("0:/second.lua") -- added to the same execution context
```

`second.lua`
```lua
result = sum(2, 2) -- the function sum() is available, since second.lua is placed in the very same execution context as first.lua, in which the "calculator" namespace is imported, meaning its automatically imported to second.lua as well
```

!!! seealso
    Execution contexts also contain variables, which can be accessed through ELua scripts. See [Execution context](exec-context.md) for more details.
    

## `#!lua Include()` function under the hood
Whenever you import something, the imported scripts are actually being executed:

`first.lua`
```lua
result = 2 + 2
```

`second.lua`
```lua
Include("0:/first.lua")
result = result + 2 
-- result will have a value of 6 now, since the Include() line actually executed first.lua
```