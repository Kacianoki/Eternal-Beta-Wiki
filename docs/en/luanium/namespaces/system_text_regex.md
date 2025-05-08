# Tables
## regex
This class provides a **.NET implementation** of regex

### Functions
- `#!lua is_match(input, pattern)`
    Returns `boolean`
- `#!lua matches(input, pattern)`
    Returns a table where the key is the index and the value is `string`(**match value**)
- `#!lua matches_groups(input, pattern, target_groups)`
    Returns a table where the key is the index and the value is `string`(**group value**)
    `target_groups` - is the group names table, which value the function should return
- `#!lua replace(input, replace_to, pattern)`
    Returns string

# Examples:
```lua
Include("system_console")
Include("system_text_regex")

local pattern = [[\S+]]

while True do
console.print("Write something: ")
input = console.readln()
value = regex.is_match(input, pattern)

console.println("Is in input only chars: " + value)
end
```

```lua
Include("system_console")
Include("system_text_regex")

local pattern = [[(?:"((?:\\.|[^"\\])*)"|([^\s]+))]]
local groups = {1, 2}

console.print("Write some command: ")
local input = console.readln()

for index, token in pairs(regex.matches_groups(input, pattern, groups)) do
    console.println(token)
end
```
