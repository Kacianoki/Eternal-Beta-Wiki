# `system_io`
`system_io` offers functionality of files, directories, paths and drives.

## `disks`
This table gives us information about disks:

`#!lua disks.list()` - returns index table of all connected drives
`#!lua disks.get_info(index)` - returns drive info in a table

```lua
Include("system_io")

for _, id in pairs(disk.list()) do
    local info = disk.get_info(id)
    
    console.println("Name: " .. info["name"])
    console.println("Drive size: " .. info["size"]) -- In bytes
    console.println("Used: " .. info["used_space"]) -- In bytes
    console.println("Available: " .. info["size"] - info["used_space"])
end
```

## `directory`
Offers directory functionality:

```lua
Include("system_io")

local dir = directory.create(0, "/temp") -- 0 is the drive index
console.println("Directory owner: " .. dir["owner"])

if directory.exists(0, "/temp") then
    directory.delete(0, "/temp")
else
    console.println(0, "Directory disappeared 🤨")
end
```

## `file`
Offers file functionality:

```lua
Include("system_io")

local dir = file.create(0, "/temp") -- 0 is the drive index
console.println("File owner: " .. dir["owner"])

console.print("Your name: ")
local name = console.readln()

file.write_text(0, "/temp", name)
name = file.read_text(0, "/temp")

console.println("Your name is " .. name .. "! I knew it!!!")

if directory.exists(0, "/temp") then
    directory.delete(0, "/temp")
else
    console.println(0, "File disappeared 🤨")
end
```

!!! seealso
    [Drive indexes](../intro.md#_3)