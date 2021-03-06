## The `foldr` function
Many functions that take a list as their argument can be defined using the following simple pattern of recursion on lists:
```Haskell
f []     = v
f (x:xs) = x # f xs
```
* That is, the function maps the empty list to a value `v`, and any non-empty list to an operator `#` applied to the head of the list and the result of recursively processing the tail. For example, a number of familiar library functions on lists can be defined using this pattern of recursion:
```Haskell
sum []     = 0
sum (x:xs) = x + sum xs

product []     = 1
product (x:xs) = x * product xs

or []     = False
or (x:xs) = x || or xs

and []     = True
and (x:xs) = x && and xs 
```
The higher-order library function `foldr` (abbreviating ***fold right***) encapsulates this pattern of recursion for defining functions on lists, with the operator `#` and the value `v` as arguments. For example, using `foldr` the four definitions above can be rewritten more compactly as follows:
```Haskell
sum :: Num a => [a] -> a
sum = foldr (+) 0

product :: Num a => [a] -> a
product = foldr (*) 1

or :: [Bool] -> Bool
or = foldr (||) False

and :: [Bool] -> Bool
and = foldr (&&) True
```
These new definitions could also include explicit list arguments, as in
```Haskell
sum xs = foldr (+) 0 xs
```
but we prefer the above definitions in which these arguments are made implicit using partial application because they are simpler.
* The `foldr` function itself can be defined using recursion:
```Haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f v []     = v
foldr f v (x:xs) = f x (foldr f v xs)
```
* That is, the function `foldr f v` maps the empty list to the value `v`, and any non-empty list to the function `f` applied to the head of the list and the recursively processed tail. In practice, however, it is best to think of the behaviour of `foldr f v` in a non-recursive manner, as simply replacing each cons operator in a list by the function `f`, and the empty list at the end by the value `v`. For example, applying the function `foldr (+) 0` to the list
```Haskell
1 : (2 : (3 : []))
```
gives the result
```Haskell
1 + (2 + (3 + 0))
```
in which `:` and `[]` have been replaced by `+` and `0`, respectively. Hence, the definition `sum = foldr (+) 0` states that summing a list of numbers amounts to replacing each cons by addition and the empty list by zero.

Even though `foldr` encapsulates a simple pattern of recursion, it can be used to define many more functions than might first be expected. First of all, recall the following definition for the library function `length`:
```Haskell
length :: [a] -> Int
length []     = 0
length (_:xs) = 1 + length xs
```
For example, applying `length` to the list
```Haskell
1 : (2 : (3 : []))
```
gives the result
```Haskell
1 + (1 + (1 + 0))
```
* That is, calculating the length of a list amounts to replacing each cons by the addition that adds one to its second argument, and the empty list by zero. Hence, the definition for `length` can be rewritten using `foldr`:
```Haskell
length :: [a] -> Int
length = foldr (\_ n -> 1+n) 0
```

Now let us consider the library function that reverses a list, which can be defined in a simple manner using explicit recursion as follows:
```Haskell
reverse :: [a] -> [a]
reverse []     = []
reverse (x:xs) = reverse xs ++ [x]
```
For example, applying `reverse` to the list 
```Haskell
1 : (2 : (3 : []))
```
gives the result
```Haskell
(([] ++ [3]) ++ [2]) ++ [1]
```
It is perhaps not clear from the definition, or the example, how `reverse` can be defined using `foldr`. However, if we define a function `snoc x xs = xs ++ [x]` that adds a new element at the end of a list rather than at the start (snoc is cons backwards), then `reverse` can be defined as
```Haskell
reverse []     = []
reverse (x:xs) = snoc x (reverse xs) 
```
from which a definition using `foldr` is then immediate:
```Haskell
reverse :: [a] -> [a]
reverse = foldr snoc []
```
We conclude this section by noting that the name ***fold right*** reflects the use of an operator that is assumed to associate to the right. For example, evaluating `foldr (+) 0 [1,2,3]` gives the result `1+(2+(3+0))`, in which the bracketing specifies that addition is assumed to associate to the right. More generally, the behaviour of `foldr` can be summarised as follows:
```Haskell
foldr (#) v [x0,x1,...,xn] = x0 # (x1 # (... (xn # v) ...))
```
