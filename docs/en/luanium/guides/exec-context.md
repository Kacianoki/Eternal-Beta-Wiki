# Execution context
In this guide you will learn more about so called execution context and about its variables.

## Variables
To retrieve a variable from execution context, you need to call the function from `system` namespace.
!!! seealso
    More details about `system` namespace can be found in the [API Basics](./api-basics/intro.md) or in
    [Namespaces](../namespaces/system.md) guide.

Here is the list of existing functions for retrieving execution context variables:

- `#!lua Get_current_permission()`

### Current permission
Each execution context has some "access level", that measures from `0` to `4,294,967,295` (2^32-1).
This "access level", for example, determines the behavior of certain functions in `system_io`. It can be 
retrieved by calling `#!lua Get_current_permission()`


!!! seealso
    More details about `system_io` namespace can be found in [API Basics](./api-basics/intro.md) или в [Namespaces](../namespaces/system_io.md) guides.