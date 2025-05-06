# Таблицы
## regex
Этот класс предоставляет **.NET реализацию** регулярных выражений

### Функции
- `#!lua is_match(input, pattern)`
    Вернёт `boolean` значение
- `#!lua matches(input, pattern)`
    Вернёт таблицу, где ключ - это индекс, а значение - `string`(**match value**)
- `#!lua matches_groups(input, pattern, target_groups)`
    Вернёт таблицу, где ключ - это индекс, а значение - `string`(**group value**)
    `target_groups` - это таблица имён групп, чьи значение функция должна вернуть
- `#!lua replace(input, replace_to, pattern)`
    Returns string

# Примеры:
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
