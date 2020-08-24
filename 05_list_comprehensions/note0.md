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

# Guards
List comprehensions can also use logical expressions called *guards* to filter the values produced by earlier generators. If a guard is `True`, then the current values are retained; if it is `False`, then they are discarded. For example, the comprehension `[x | x <- [1..10], even x]` produces the list `[2,4,6,8,10]` of all even numbers from the list `[1..10]`. Similarly, a function that maps a positive integer to its list of positive factors can be defined by:
```Haskell
factors :: Int -> [Int]
factors = \n -> [x | x <- [1..n], mod n x == 0]

```
Recall that an integer greater than one is *prime* if its only positive factors are one and the number itself. Hence, by using `factors`, a simple function that decides if an integer is prime can be defined as follows:
```Haskell
prime :: Int -> Bool
prime = \n -> factors n == [1,n]

```
Note that deciding that a number such as `15` is not prime does not require the function `prime` to produce all of its factors, because under lazy evaluation the result `False` is returned as soon as any factor other than one or the number itself is produced, which for this example is given by the factor `3`.

Returning to list comprehensions, using `prime` we can now define a function that produces the list of all prime numbers up to a given limit:
```Haskell
primes :: Int -> [Int]
primes = \n -> [x| x <- [2..n], prime x]

```
In chapter 15 we will present a more efficient program to generate prime numbers using the famous *sieve of Eratosthenes*, which has a particularly clear and concise implementation in Haskell using the idea of lazy evaluation.

As a final example concerning guards, suppose that we represent a lookup table by a list of pairs of keys and values. Then for any type of keys that supports equality, a function `find` that returns the list of all values that are associated with a given key in a table can be defined as follows:
```Haskell
find :: Eq a => a -> [(a,b)] -> [b]
find = \k -> \t -> [v | (k',v) <- t, k == k']

```

# The `zip` function
The library function `zip` produces a new list by pairing successive elements from two existing lists until either or both lists are exhausted. For example:
```Shell
> zip ['a','b','c'] [1,2,3,4]
[('a',1),('b',2),('c',3)]

```
The function `zip` is often useful when programming with list comprehensions. For example, suppose that we define a function that returns the list of all pairs of adjacent elements from a list as follows:
```Haskell
pairs :: [a] -> [(a,a)]
pairs = \xs -> zip xs (tail xs)

```
Then using `pairs` we can now define a function that decides if a list of elements of any ordered type is sorted by simply checking that all pairs of adjacent elements from the list are in the correct order:
```Haskell
sorted :: Ord a => [a] -> Bool
sorted = \xs -> sum [1 | (x,y) <- pairs xs, x < y] == (length xs) - 1

sorted' :: Ord a => [a] -> Bool
sorted' = \xs -> and [x <= y | (x,y) <- pairs xs]

```
Similarly to the function `prime`, deciding that a list such as `[1,3,2,4]` is not sorted may not require the function `sorted` to produce all pairs of adjacent elements, because the result `False` is returned as soon as any non-ordered pair is produced, which in this example is given by the pair `(3,2)`.

Using `zip` we can also define a function that returns the list of all positions at which a value occurs in a list, by pairing each element with its position, and selecting those positions at which the desired value occurs:
```Haskell
positions' :: Eq => a -> [a] -> [Int]
positions' x xs = [i | (e,i) <- zip xs [0..(length xs - 1)], e == x]

positions :: Eq => a -> [a] -> [Int]
positions = \x -> \xs -> [i | (x',i) <- zip xs [0..], x == x']

```
Within the definition for `positions`, the expression `[0..]` produces the list of indices `[0,1,2,3,...]`. This list is notionally *infinitive*, but under lazy evaluation only as many elements of the list as required by the context in which it is used, in this case zipping with the input list `xs`, will actually by produced. Exploiting lazy evaluation in this manner avoids the need to explicitly produce a list of indices of the same length as the input list. 
