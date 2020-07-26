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

### `Read` - readable types
This class is dual to `Show`, and contains types whose values can be converted from strings of characters using the following method:
```Haskell
read :: String -> a

```
All the basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Read` class, as are list types and tuple types, provided that their element and component types are instances. For example:
```Shell
> read "False" :: Bool
False

> read "'a'" :: Char
'a'

> read "123" :: Int
123

> read "[1,2,3]" :: [Int]
[1,2,3]

> read "('a',False)" :: (Char,Bool)
('a',False)
S
> read "\"abc\"" :: String
"abc"

```
The use of `::` in these examples resolves the type of the result, which would otherwise not be able to be inferred by GHCi. In practice, however, the necessary type information can usually be inferred automatically from the context. For example, the expression `not (read "False")` requires no explicit type information, because the application of the logical negation function `not`implies that `read "False"` must have type `Bool`.

Note that the result of `read` id undefined if its argument is not syntactically valid. For example, the expression `not (read "abc")` produces an error when evaluated, because `"abc"` cannot be read as a logical value.
```Shell
> not (read "abc")
*** Exception: Prelude.read: no parse

```
