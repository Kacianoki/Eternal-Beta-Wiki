# `system_io`
`system_io` предоставляет работу с файлами, директориями, путями и дисками.

## `disks`
Эта таблица позволяет нам получать информацию о дисках:

`#!lua disks.list()` - вернёт таблицу индексов всех подключённых дисков
`#!lua disks.get_info(index)` - вернёт информацию о диске в виде таблицы

```lua
Include("system_io")

for _, id in pairs(disk.list()) do
    local info = disk.get_info(id)
    
    console.println("Имя: " .. info["name"])
    console.println("Размер диска: " .. info["size"]) -- В байтах
    console.println("Занято: " .. info["used_space"]) -- В байтах
    console.println("Свободного места: " .. info["size"] - info["used_space"])
end
```

## `directory`
Предоставляет работу с директориями:

```lua
Include("system_io")

local dir = directory.create(0, "/temp") -- 0 это индекс диска
console.println("Владелец этой директории: " .. dir["owner"])

if directory.exists(0, "/temp") then
    directory.delete(0, "/temp")
else
    console.println(0, "Директория куда-то исчезла 🤨")
end
```

## `file`
Предоставляет работу с файлами:

```lua
Include("system_io")

local dir = file.create(0, "/temp") -- 0 это индекс диска
console.println("Владелец этого файла: " .. dir["owner"])

console.print("Твоё имя: ")
local name = console.readln()

file.write_text(0, "/temp", name)
name = file.read_text(0, "/temp")

console.println("Твоё имя " .. name .. "! Я знал это!!!")

if directory.exists(0, "/temp") then
    directory.delete(0, "/temp")
else
    console.println(0, "файл куда-то исчез 🤨")
end
```

!!! seealso
    [Индексация дисков](../intro.md#_3)