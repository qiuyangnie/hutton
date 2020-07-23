## Lambda expressions
As an alternative to defining functions using equations, functions can also be constructed using *lambda expressions*, which comprise a pattern for each of the arguments, a body that specifies how the result can be calculated in terms of the arguments, but do not give a name for the function itself. In other words, lambda expressions are nameless functions.

For example, the nameless function that takes a single number `x` as its argument, and produces the result `x + x`, can be constructed as follows:
```Haskell
\x -> x + x

```
The symbol `\` represents the Greek letter *lambda*, written as *λ*. Despite the fact that they have no names, functions constructed using lambda expressions can be used in the same way as any other functions. For example:
```Shell
> (\x -> x + x) 2
4

```
As well as being interesting in their own right, lambda expressions have a number of practical applications. First of all, they can be used to formalise the meaning of curried function definitions. For example, the definition
```Haskell
add :: Int -> Int -> Int
add x y = x + y

```
can be understood as meaning
```Haskell
add :: Int -> (Int -> Int)
add = \x -> (\y -> x + y)

``` 
which makes precise that `add` is a function that takes an integer `x` and returns a function, which in turn takes another integer `y` and returns the result `x + y`. Moreover, rewriting the original definition in this manner also has the benefit that the type for the function and the manner in which it is defined now have the same syntactic form, namely `? -> (? -> ?)`.
