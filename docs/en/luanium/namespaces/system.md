# Таблицы
## lua_engine
Enables work with the lua engine
### Функции
- `#!lua run(disk_id, path, permission)`
    Creates a new execution context and runs the specified script in it
    `permission` - must be equal to or less than the values of the current one.

## power_manager
Provides a PC power supply functionality **`permission` must be equal to the system one (2^32-1)**
- `#!lua shutdown()`
    Shutdown
- `#!lua reboot()`
    Reboot

## datetime
This table provides date and time functionality
### Methods
- `#!lua is_timespan(table)`
    Returns `#!lua true`, if the table is `timespan table`
- `#!lua get_current_time()`
    Returns `datetime table` containing current time
- `#!lua from_unix_secs(unix_seconds)`
    Returns `datetime table`
- `#!lua from_unix_ms(unix_milliseconds)`
    Returns `datetime table`
- `#!lua to_unix_ms(datetime_table)`
    Returns time in UNIX
- `#!lua to_unix_secs(datetime_table)`
    Returns time in UNIX
- `#!lua sub(timespan/datetime, timespan/datetime)`
    (subtract)
    Returns `timespan table` or `datetime table`.
    
    A list of valid arguments and what they will return:
    - **timespan** and **timespan** => **timespan**
    - **datetime** and **timespan** => **datetime**
    - **datetime** and **datetime** => **timespan**
- `#!lua sum(timespan/datetime, timespan/datetime)`
    Returns `timespan table` or `datetime table`.
    
    A list of valid arguments and what they will return:
    - **timespan** and **timespan** => **timespan**
    - **datetime** and **timespan** => **datetime**
- `#!lua div(timespan/datetime, timespan/datetime)`
    (divide, деление)
    Returns `timespan table` or `datetime table`.
    
    A list of valid arguments and what they will return:
    - **timespan** and **timespan** => **timespan**

### `datetime table` keys
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

### `timespan table` keys
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


## Global functions
- `#!lua Wait(ms)`
- `#!lua Get_current_permission()` 
    Returns `permission` of the current execution context
