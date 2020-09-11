## Basic concepts
Many functions can naturally be defined in terms of other functions. For example, a function that returns the ***factorial*** of a non-negative integer can be defined by using library functions to calculate the product of the integers between one and the given number:
```Haskell
fac :: Int -> Int
fac = \n -> product [1..n]
```

In Haskell, it is also permissible to define functions in terms of themselves, in which case the functions are called **recursive**. For example, the factorial function can be defined in this manner as follows:
```Haskell
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)
```
