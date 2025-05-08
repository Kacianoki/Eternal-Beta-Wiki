# Таблицы
## lua_engine
Предоставляет работу с движком lua
### Функции
- `#!lua run(disk_id, path, permission)`
    Создаст новый контекст исполнения и запустит в нём указанный скрипт
    `permission` - должно быть равно или меньше, чем значения текущего контекста исполнения.

## power_manager
Предоставляет работу с питанием ПК **`permission` должен быть равен системному (2^32-1)**
- `#!lua shutdown()`
    Выключит ПК
- `#!lua reboot()`
    Перезапустит ПК

## datetime
Эта таблица предоставляет работу с датами и временем
### Methods
- `#!lua is_timespan(table)`
    Вернёт `#!lua true`, если таблица - `timespan table`
- `#!lua get_current_time()`
    Вернёт `datetime table` содержащий текущее время
- `#!lua from_unix_secs(unix_seconds)`
    Вернёт `datetime table`
- `#!lua from_unix_ms(unix_milliseconds)`
    Вернёт `datetime table`
- `#!lua to_unix_ms(datetime_table)`
    Вернёт время в формате UNIX
- `#!lua to_unix_secs(datetime_table)`
    Вернёт время в формате UNIX
- `#!lua sub(timespan/datetime, timespan/datetime)`
    (subtract, отнять)
    Эта функция может вернуть как `timespan table`, так и `datetime table`.
    
    Список валидных аргументов и что они вернут:
    - **timespan** and **timespan** => **timespan**
    - **datetime** and **timespan** => **datetime**
    - **datetime** and **datetime** => **timespan**
- `#!lua sum(timespan/datetime, timespan/datetime)`
    (sum, add, сумма)
    Эта функция может вернуть как `timespan table`, так и `datetime table`.
    
    Список валидных аргументов и что они вернут:
    - **timespan** and **timespan** => **timespan**
    - **datetime** and **timespan** => **datetime**
- `#!lua div(timespan/datetime, timespan/datetime)`
    (divide, деление)
    Эта функция может вернуть как `timespan table`, так и `datetime table`.
    
    Список валидных аргументов и что они вернут:
    - **timespan** and **timespan** => **timespan**

### Ключи `datetime table`
- `microseconds` - int
- `milliseconds` - int
- `second` - int
- `minute` - int
- `hour` - int
- `day` - int
- `day_of_week` - int
- `day_of_year` - int
- `month` - int
- `year` - int

### Ключи `timespan table`
- `microseconds` - int
- `milliseconds` - int
- `seconds` - int
- `minutes` - int
- `hours` - int
- `days` - int
- `total_seconds` - float
- `total_minutes` - float
- `total_hours` - float
- `total_days` - float
- `total_microseconds` - float
- `total_milliseconds` - float


## Глобальные функции
- `#!lua Wait(ms)`
- `#!lua Get_current_permission()` 
    Вернёт `permission` текущего контекста выполнения
