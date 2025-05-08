# Tables
## json
This class enables working with JSON
### Methods
- `#!lua encode(table)`
- `#!lua decode(json_string)`
    Returns a table
# Examples:
```lua
Include("system_console")
Include("system_text_json")

local table = {}

console.print("Write your first name: ")
table["first_name"] = console.readln()

console.print("Write your last name:")
table["last_name"] = console.readln()

console.println(json.encode(table))
```

```lua
Include("system_console")
Include("system_text_json")

console.print("Enter JSON data:")
local json = console.readln()
local table = json.decode(json)

console.println("First name is " .. table["first_name"])
console.println("Last name is " .. table["last_name"])
```

The source code for this library can be found at https://github.com/rxi/json.lua