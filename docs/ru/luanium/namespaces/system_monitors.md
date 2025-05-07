# Таблицы
## cpu
Эта таблица предоставляет доступ к `cpu monitor`
### Methods
- `#!lua get_usage(core_id)`
    Вернёт процент использования ядра процессора
- `#!lua get_average_usage()`
    Вернёт процент использования процессора
- `#!lua get_info()`
    Вернёт `cpu info table`
### Ключи `Cpu info table`
- `name` - Имя
- `health` - Здоровье, состояние
- `total_cores` - Количество ядер