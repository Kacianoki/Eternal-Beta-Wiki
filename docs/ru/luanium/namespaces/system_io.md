# Таблицы
## disk
Эта таблица предоставляет доступ к дискам
### Функции
- `#!lua list()`
    Вернёт таблицу индексов подключенных дисков
- `#!lua get_info(index)`
    Вернёт таблицу, содержащая информацию о диске
    Ключи таблицы:
    - `size` - Размер диска в байтах
    - `used_space` - Размер занятого пространства в байтах
    - `used_space_precentage` - Размер занятого пространства в процентах
    - `name` - Имя диска

### Примеры

```lua
Include("system_io")

for _, id in pairs(disk.list()) do
    local info = disk.get_info(id)
    console.println(string.format("%d:%s (%i / %i) %f%%", id, info["name"], info["used_space"], info["size"], info["used_space_precentage"] * 100))
end
```

## file
Эта таблица предоставляет доступ к файлам
### Methods
- `#!lua exists(disk_id, path`
    Вернёт `boolean` значение
- `#!lua read_bytes(disk_id, path)`
    Вернёт таблицу байтов
- `#!lua write_bytes(disk_id, path, table_of_bytes)`
- `#!lua read_text(disk_id, path)`
    Вернёт `string`
- `#!lua write_text(disk_id, path, text)`
- `#!lua read_lines(disk_id, path)`
    Вернёт таблицу строк
- `#!lua write_lines(disk_id, path, table_of_strings)`
- `#!lua delete(disk_id, path)`
- `#!lua create(disk_id, path)`
    Вернёт `file meta table`
- `#!lua get_meta(disk_id, path)`
    Вернёт `file meta table`
- `#!lua move(disk_od, path, target_path)`
- `#!lua copy(disk_od, path, target_path)`

### Ключи `file meta table`
- `path`  -    Абсолютный путь до файла
- `size`  -    Размер файла в байтах
- `modified` - Дата и время последнего изменения файла в UNIX формате (секунды)
- `created`  - Дата и время создания файла в UNIX формате (секунды)
- `owner`    - Владелец файла
## directory
Эта таблица предоставляет доступ к директориям
### Methods
- `#!lua exists(disk_id, path)`
    Вернёт `boolean` значение
- `#!lua create(disk_id, path)`
    Вернёт `directory meta table`
- `#!lua get_meta(disk_id, path)`
    Вернёт `directory meta table`
- `#!lua delete(disk_id, path)`
- `#!lua move(disk_od, path, target_path)`
- `#!lua copy(disk_od, path, target_path)`
- `#!lua get_files(disk_id, path)`
    Вернёт таблицу строк
- `#!lua get_directories(disk_id, path)`
    Вернёт таблицу строк
### Ключи `directory meta table`
- `path`  -    Абсолютный путь до файла
- `modified` - Дата и время последнего изменения файла в UNIX формате (секунды)
- `created`  - Дата и время создания файла в UNIX формате (секунды)
- `owner`    - Владелец файла
## Глобальные функции
- `#!lua Get_file_name(path)`           -    Вернёт имя файла с его расширениеми
- `#!lua Get_directory_name(path)`      -    Вернёт имя директории
- `#!lua Combine_paths(table of paths)` -    Объединяет пути в один
- `#!lua Get_parent_directory(path)`    -    Вернёт родительскую директорию