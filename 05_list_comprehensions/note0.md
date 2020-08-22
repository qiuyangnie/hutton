# Basic concepts
In mathematics, the *comprehension* notation can be used to construct new sets from existing sets. In Haskell, a similar comprehension notation can be used to construct new lists from existing lists. For example:
```Shell
> [x^2 | x <- [1..5]]
[1,4,9,16,25]

```
The symbol `|` is read as *such that*, `<-` is read as *is drawn from*, and the expression `x <- [1..5]` is called a *generator*. A list comprehension can have more than one generator, with successive generators being separated by commas. For example, the list of all possible pairings of an element from the list `[1,2,3]` with an element from the list `[4,5]` can be produced as follows:
```Shell
> [(x,y) | x <- [1,2,3], y <- [4,5]]
[(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]

```
Changing the order of the two generators in this example produces the same set of pairs, by arranged in a different order:
```Shell
> [(x,y) | y <- [4,5], x <- [1,2,3]]
[(1,4),(2,4),(3,4),(1,5),(2,5),(3,5)]

```
In particular, whereas in this case the `x` components of the pairs change more frequently than the `y` components (`1,2,3,1,2,3` versus `4,4,4,5,5,5`), in the previous case the `y` components change more frequently than the `x` components (`4,5,4,5,4,5` versus `1,1,2,2,3,3`). These behaviours can be understood by thinking of later generators as being more deeply nested, and hence changing the values of their variables more frequently than earlier generators.

Later generators can also depend upon the values of variables from earlier generators. For example, the list of all possible ordered pairings of elements from the list `[1..3]` can be produced as follows:
```Shell
> [(x,y) | x <- [1..3], y <- [x..3]]
[(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]

```
As a more practical example of this idea, the library function `concat` that concatenates a list of lists can be defined by using one generator to select each list in turn, and another to select each element from each list:
```Haskell
concat' :: [[a]] -> [a]
concat' xss = [x | xs <- xss, x <- xs]

```
The wildcard pattern `_` is sometimes useful in generators to discard certain elements from a list. For example, a function that selects all the first components from a list of pairs can be defined as follows:
```Haskell
firsts :: [(a,b)] -> [a]
firsts ps = [x | (x,_) <- ps]

```
Similarly, the library function that calculates the length of a list can be defined by replacing each element by one and summing the resulting list:
```Haskell
length' :: [a] -> Int
length' xs = sum [1 | _ <- xs]

```
In this case, the generator `_ <- xs` simply serves as a counter to govern the production of the appropriate number of ones.