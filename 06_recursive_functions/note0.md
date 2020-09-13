## Basic concepts
Many functions can naturally be defined in terms of other functions. For example, a function that returns the ***factorial*** of a non-negative integer can be defined by using library functions to calculate the product of the integers between one and the given number:
```Haskell
fac :: Int -> Int
fac = \n -> product [1..n]
```

In Haskell, it is also permissible to define functions in terms of themselves, in which case the functions are called ***recursive***. For example, the factorial function can be defined in this manner as follows:
```Haskell
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)
```

* The first equation states that the factorial of zero is one, and is called a ***base case***.

* The second equation states that the factorial of any other number is given by the product of that number and the factorial of its predecessor, and is called a ***recursive case***.

As another example of recursion on integers, consider the multiplication operator `*` used above. For non-negative integers it can also be defined using recursion on either of its two arguments, such as the second:
```Haskell
(*) :: Int -> Int -> Int
m * 0 = 0
m * n = m + m * (n-1)
```
* That is, the recursive definition for the `*` operator formalises the idea that multiplication can be reduced to repeated addition.

## Recursion on lists
The library function `product` used in the preceding section can be defined as follows:
```Haskell
product' :: Num a => [a] -> a
product' []     = 1
product' (n:ns) = n * product' ns
```
* The first equation states that the product of the empty list of numbers is one, which is appropriate because one is the identity for multiplication.

* The second equation states that the product of any non-empty list is given by multiplying the first number and the product of the remaining list.

The library function `length` can be defined using the same pattern of recursion as `product`:
```Haskell
length' :: [a] -> Int
length' []     = 0
length' (_:xs) = 1 + length' xs
```

The library function that reverses a list. This function can be defined using recursion as follows:
```Haskell
reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]
```

In turn, the append operator `++` used in the above definition of `reverse` can itself be defined using recursion on its first argument:
```Haskell
(++) :: [a] -> [a] -> [a]
[]     ++ ys = ys
(x:xs) ++ ys = x : xs ++ ys       -- function application has higher priority than all other operators in the language
```
* That is, the recursive definition `++` formalises the idea that two lists can be appended by copying elements from the first list until it is exhausted, at which point the second list is joined on at the end.

A function that inserts a new element of any ordered type into a sorted list to give another sorted list can be defined as follows:
```Haskell
insert :: Ord a => a -> [a] -> [a]
insert x []     = [x]
insert x (y:ys) 
   | x <= y     = x : y : ys
   | otherwise  = y : insert x ys 
```
* That is, inserting a new element into an empty list gives a singleton list, while for a non-empty list the result depends upon the ordering of the new element `x` and the head of the list `y`. In particular, if `x <= y` then the new element `x` is simply prepended to the start of the list, otherwise the head `y` becomes the first element of the resulting list, and we then proceed to insert the new element into the tail of the given list.

Using `insert` we can now define a function that implements ***insertion sort***, in which the empty list is already sorted, and any non-empty list is sorted by inserting its head into the list that results from sorting its tail:
```Haskell
isort :: Ord a => [a] -> [a]
isort []     = []
isort (x:xs) = insert x (isort xs)
```
## Advice on recursion
