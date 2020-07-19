## Lambda expressions
As an alternative to defining functions using equations, functions can also be constructed using *lambda expressions*, which comprise a pattern for each of the arguments, a body that specifies how the result can be calculated in terms of the arguments, but do not give a name for the function itself. In other words, lambda expressions are nameless functions.

For example, the nameless function that takes a single number `x` as its argument, and produces the result `x + x`, can be constructed as follows:
```Haskell
\x -> x + x

```
The symbol `\` represents the Greek letter *lambda*, written as *λ*. Despite the fact that they have no names, functions constructed using lambda expressions can be used in the same way as any other functions. For example:
```Haskell
(\x -> x + x) 2

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

Secondly, lambda expressions are also useful when defining functions that return functions as results by their very nature, rather than as a consequence of currying. For example, the library function `const` that returns a constant function that always produces a given value can be defined as follows:
```Haskell
const :: a -> b -> a
const x _ = x

```
However, it is more appealing to define `const` in a way that makes explicit that it returns a function as its result, by including parentheses in the type and using a lambda expression in the definition itself:
```Haskell
const :: a -> (b -> a)
const x = \_ -> x

```
Finally, lambda expressions can be used to avoid having to name a function that is only referenced once in a program. For example, a function  `odds` that returns the first `n` odd integers can be defined as follows:
```Haskell
odds :: Int -> [Int]
odds n = map f [0..n-1]
         where f x = x*2 + 1

```
(The library function `map` apples a function to all elements of a list.) However, because the locally defined function `f` is only referenced once, the definition for `odds` can be simplified by using a lambda expression:
```Haskell
odds :: Int -> [Int]
odds n = map (\x -> x*2 + 1) [0..n-1]

```
