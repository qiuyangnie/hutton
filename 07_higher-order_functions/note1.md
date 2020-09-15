## Processing lists
The function `map` applies a function to all elements of a list, and can be defined using a list comprehension as follows:
```Haskell
map :: (a -> b) -> [a] -> [b]
map = \f -> (\xs -> [f x | x <- xs])
```
* That is, `map f xs` returns the list of all values `f x` such that `x` is an element of the argument list `xs`. For example, we have:
```Shell
Prelude> map (+1) [1,3,5,7]
[2,4,6,8]
Prelude> map even [1,2,3,4]
[False,True,False,True]
Prelude> map reverse ["abc","def","ghi"]
["cba","fed","ihg"]
```
* Three further points to note about `map`.
 1. It is a polymorphic function that can be applied to lists of any type, as are most higher-order functions on lists.
 2. It can be applied to itself to process nested lists. For example, the function `map (map (+1))` increments each number in a list of lists of numbers, as shown in the following calculations:
 ```
   map (map (+1)) [[1,2,3],[4,5]]
=      { applying the outer map }
   [map (+1) [1,2,3], map (+1) [4,5]]
=      { applying the inner maps }
   [[2,3,4],[5,6]]
 ```
 3. The function `map` can also be defined using recursion:
```Haskell
map :: (a -> b) -> [a] -> [b]
map f []     = []
map f (x:xs) = f x : map f xs
```
* That is, applying a function to all elements of the empty list gives the empty list, while for a non-empty list the function is simply applied to the head of the list, and we then proceed to apply the function to all elements of the tail. The original definition for `map` using a list comprehension is simpler, but the recursive definition is preferable for reasoning purposes (see chapter 16).


Another useful higher-order library function is `filter`, which selects all elements of a list that satisfy a predicate, where a predicate (or property) is a function that returns a logical value. As with `map`, the function `filter` also has a simple definition using a list comprehension:
```Haskell
filter :: (a -> Bool) -> [a] -> [a]
filter p xs = [x | x <- xs, p x]
```
* That is, `filter p xs` returns the list of all values `x` such that `x` is an element of the list `xs` and the value of `p x` is `True`. For example:
```Shell
Prelude> filter even [1..10]
[2,4,6,8,10]
Prelude> filter (> 5) [1..10]
[6,7,8,9,10]
Prelude> filter (/= ' ') "abc def ghi"
"abcdefghi"
```
As with `map`, the function `filter` can be applied to lists of any type, and can be defined using recursion for the purposes of reasoning:
```Haskell
filter :: (a -> Bool) -> [a] -> [a]
filter p []                 = []
filter p (x:xs) | p x       = x : filter p xs
                | otherwise = filter p xs
```
* That is, selecting all elements that satisfy a predicate from the empty list gives the empty list, while for a non-empty list the result depends upon whether the head satisfies the predicate. If it does then the head is retained and we then proceed to filter elements from the tail of the list, otherwise the head is discarded and we simply filter elements from the tail.
