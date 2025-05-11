# Tables
## console
### Functions
- `#!lua print(input)`
- `#!lua println(input)`
- `#!lua readln()`
    Returns string
- `#!lua clear()`
- `#!lua abort_reading()`
`#!lua print` and `#!lua println` use [BBCode](https://www.bbcode.org/how-to-use-bbcode-a-complete-guide.php) so you can use that
- `#!lua add_click_hook(func)`
    Adds `func` function to console click hook. Function must have 3 args:
    ```lua
    function clicked(x, y, type)
        -- `type` passes the index of the pressed button:
        -- 0 - None
        -- 1 - Left
        -- 2 - Right
        -- 3 - Middle
        -- 4 - Extra button 1
        -- 5 - Extra button 2
    end
    ```
- `#!lua remove_click_hook(func)`
    Removes `func` function from console click hook.