# Tables
## disk
This table gives access to the disks 
### Functions
- `#!lua list()`
    Returns index table of connected drives
- `#!lua get_info(index)`
    Returns table, containing drive information
    Table keys:
    - `size` - Drive size, bytes
    - `used_space` - Used space, bytes
    - `used_space_precentage` - Used space, percentages
    - `name` - Drive name

### Examples

```lua
Include("system_io")

for _, id in pairs(disk.list()) do
    local info = disk.get_info(id)
    console.println(string.format("%d:%s (%i / %i) %f%%", id, info["name"], info["used_space"], info["size"], info["used_space_precentage"] * 100))
end
```

## file
This table gives access to the files
### Methods
- `#!lua exists(disk_id, path`
    Returns `boolean`
- `#!lua read_bytes(disk_id, path)`
    Returns byte table
- `#!lua write_bytes(disk_id, path, table_of_bytes)`
- `#!lua read_text(disk_id, path)`
    Returns `string`
- `#!lua write_text(disk_id, path, text)`
- `#!lua read_lines(disk_id, path)`
    Returns string table
- `#!lua write_lines(disk_id, path, table_of_strings)`
- `#!lua delete(disk_id, path)`
- `#!lua create(disk_id, path)`
    Returns `file meta table`
- `#!lua get_meta(disk_id, path)`
    Returns `file meta table`
- `#!lua move(disk_od, path, target_path)`
- `#!lua copy(disk_od, path, target_path)`

### `file meta table` keys
- `path`  -    Absolute file path
- `size`  -    File size, bytes
- `modified` - Date and time of the last modification in UNIX (seconds)
- `created`  - Date and time of the file creation in UNIX (seconds)
- `owner`    - File owner
## directory
This table gives access to the directories
### Methods
- `#!lua exists(disk_id, path)`
    Returns `boolean` 
- `#!lua create(disk_id, path)`
    Returns `directory meta table`
- `#!lua get_meta(disk_id, path)`
    Returns `directory meta table`
- `#!lua delete(disk_id, path)`
- `#!lua move(disk_od, path, target_path)`
- `#!lua copy(disk_od, path, target_path)`
- `#!lua get_files(disk_id, path)`
    Returns string table
- `#!lua get_directories(disk_id, path)`
    Returns string table
### `directory meta table` keys
- `path`  -    Absolute file path
- `modified` - Date and time of the last modification in UNIX (seconds)
- `created`  - Date and time of the file creation in UNIX (seconds)
- `owner`    - File owner
## Global functions
- `#!lua Get_file_name(path)`           -    Returns file name with the extension
- `#!lua Get_directory_name(path)`      -    Returns directory name
- `#!lua Combine_paths(table of paths)` -    Combines the paths into one 
- `#!lua Get_parent_directory(path)`    -    Returns parent directory