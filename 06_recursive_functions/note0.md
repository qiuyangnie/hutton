## Basic concepts
Many functions can naturally be defined in terms of other functions. For example, a function that returns the ***factorial*** of a non-negative integer can be defined by using library functions to calculate the product of the integers between one and the given number:
```Haskell
fac :: Int -> Int
fac = \n -> product [1..n]
```
