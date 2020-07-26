### `Show` - showable types
This class contains types whose values can be converted into strings of characters using the following method:
```Haskell
show :: a -> String

```
All the basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Show` class, as are list types and tuple types, provided that their element and component types are instances. For example:
```Shell
> show False
"False"

> show 'a'
"'a'"

> show 123
"123"

> show [1,2,3]
"[1,2,3]"

> show ('a',False)
"('a',False)"

> show "abc"
"\"abc\""

```
