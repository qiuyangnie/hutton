## Operator sections
Functions such as `+` that are written between their two arguments are called *operators*. As we have already seen, any function with two arguments can be converted into an operator be enclosing the name of the function in single back quotes, as in ``7 `div` 2``. However, the converse is also possible. In particular, any operator can be converted into a curried function that is written before its arguments by enclosing the name of the operator in parentheses, as in `(+) 1 2`. Moreover, this convention also allows one of the arguments to be included in the parentheses if desired, as in `(1+) 2` and `(+2) 1`.

In general, if `#` is an operator, then expressions of the form `(#)`. `(x #)`, and `(# y)` for arguments `x` and `y` are called *sections*, whose meaning as functions can be formalised using lambda expressions as follows:
```Haskell
(#) = \x -> (\y -> x # y)
(x #) = \y -> x # y
(# y) = \x -> x # y

```
Sections have three primary applications. First of all, they can be used to construct a number of simple but useful functions in a particularly compact way, as shown in the following examples:
* `(+)` is the addition function `\x -> (\y -> x+y)`
* `(1+)` is the successor function `\y -> 1+y`
* `(1/)` is the reciprocation function `\y -> 1/y`
* `(*2)` is the doubling function `\x -> x*2`
* `(/2)` is the halving function `\x -> x/2`

Secondly, sections are necessary when tarting the type of operators, because an operator itself is not a valid expression in Haskell. For example, the type of the addition operator `+` for integers is stated as follows:
```Haskell
(+) :: Int -> Int -> Int

```
Finally, sections are also necessary when using operators as arguments to other functions. For example, the library function `sum` that calculates the sum of a list of integers can be defined by using the operator `+` as an argument to the library function `foldl`, which is itself discussed in chapter 7:
```Haskell
sum :: [Int] -> Int
sum = foldl (+) 0

``` 
