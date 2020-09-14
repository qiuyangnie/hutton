# Higher-order functions
## Basic concepts
Functions with multiple arguments are usually defined in Haskell using the notion of currying. That is, the arguments are taken one at a time by exploiting the fact that functions can return functions as results. For example, the definition
```Haskell
add :: Int -> Int -> Int
add x y = x + y
```
means
```Haskell
add : Int -> (Int -> Int)
add = \x -> (\y -> x + y)
```
and states that `add` is a function that takes an integer `x` and returns a function, which in turn takes another integer `y` and returns their sum `x + y`. In Haskell, it is also permissible to define functions that take functions as arguments. For example, a function that takes a function and a value, and returns the result of applying the function twice to the value, can be defined as follows:
```Haskell
twice :: (a -> a) -> a -> a
twice f x = f (f x)
```
For example:
```Shell
Prelude> twice (*2) 3
12
Prelude> twice reverse [1,2,3]
[1,2,3]
```
Moreover, because `twice` is a curried function, it can be partially applied with just one argument to build other useful functions. For example, a function that quadruples a number is given by `twice (*2)`, and the fact that reversing a (finite) list twice has no effect is captured by the equation `twice reverse = id`, where `id` is the identity function defined by `id x = x`.

Formally speaking, a function that takes a function as an argument or returns a function as a result is called a ***higher-order function***. In practice, however, because the term curried already exists for returning functions as results, the term higher-order is often just used for taking functions as arguments. It is this latter interpretation that is the subject of this chapter.

Using higher-order functions considerably increases the power of Haskell, by allowing common programming patterns to be encapsulated as functions within the language itself. More generally, higher-order functions can be used to define domain-specific languages within Haskell. For example, in this chapter we present a simple language for a range of other domains, including interactive programming, effectful programming, and building parsers.
