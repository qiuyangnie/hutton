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

The first equation states that the factorial of zero is one, and is called a ***base case***.

The second equation states that the factorial of any other number is given by the product of that number and the factorial of its predecessor, and is called a ***recursive case***.

As another example of recursion on integers, consider the multiplication operator `*` used above. For non-negative integers it can also be defined using recursion on either of its two arguments, such as the second:
```Haskell
(*) :: Int -> Int -> Int
m * 0 = 0
m * n = m + m * (n-1)
```
That is, the recursive definition for the `*` operator formalises the idea that multiplication can be reduced to repeated addition.
