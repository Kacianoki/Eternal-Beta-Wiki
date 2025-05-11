# Таблицы
## console
### Функции
- `#!lua print(input)`
- `#!lua println(input)`
- `#!lua readln()`
    Returns string
- `#!lua clear()`
- `#!lua abort_reading()`
`#!lua print` и `#!lua println` используют [BBCode](https://www.bbcode.org/how-to-use-bbcode-a-complete-guide.php) так что вы можете это использовать
`#!lua print` and `#!lua println` use [BBCode](https://www.bbcode.org/how-to-use-bbcode-a-complete-guide.php) so you can use that
- `#!lua add_click_hook(func)`
    Добавляет функцию `func` в обработчик нажатий по консоли. Функция должна принимать 3 аргумента:
    ```lua
    function clicked(x, y, type)
        -- `type` определяет индекс нажатой кнопки:
        -- 0 - Никакая
        -- 1 - Левая
        -- 2 - Права
        -- 3 - Среднаяя
        -- 4 - Дополнительная 1
        -- 5 - Дополнительная 2
    end
    ```
- `#!lua remove_click_hook(func)`
    Убирает функцию `func` из обработчика нажатий по консоли.