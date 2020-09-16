## The `foldr` function
Many functions that take a list as their argument can be defined using the following simple pattern of recursion on lists:
```Haskell
f []     = v
f (x:xs) = x # f xs
```
* That is, the function maps the empty list to a value `v`, and any non-empty list to an operator `#` applied to the head of the list and the result of recursively processing the tail. For example, a number of familiar library functions on lists can be defined using this pattern of recursion:

