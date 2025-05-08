# Tables
## cpu
This table gives access to the `cpu monitor`
### Methods
- `#!lua get_usage(core_id)`
    Returns the percentage of CPU core usage
- `#!lua get_average_usage()`
    Returns the percentage of CPU usage
- `#!lua get_info()`
    Returns `cpu info table`
### `Cpu info table` keys
- `name` - Name
- `health` - Health, condition
- `total_cores` - Number of cores