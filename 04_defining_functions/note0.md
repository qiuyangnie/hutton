# Defining functions

##  New from old
Perhaps the most straightforward way to define new functions is simply by combining one or more existing functions. For example, a few library functions that can be defined in this way are shown below.

```Haskell
-- Decide if an integer is even:
even :: Integral a => a -> Bool
even n = n `mod` 2 == 0

-- Split a list at the nth element:
splitAt :: Int -> [a] -> ([a],[a])
splitAt n xs = (take n xs, drop n xs)

-- Reciprocation:
recip :: Fractional a => a -> a
recip n = 1/n

```

## Conditional expressions
Haskell provides a range of different ways to define functions that choose between a number of possible results. The simplest are *conditional expressions*, which use a logical expression called a *condition* to choose between two results of the same type. If the condition is `True`, then the first result is chosen, and if it is `False`, then the second result is chosen. For example, the library function `abs` that returns the absolute value of an integer can be defined as follows:
```Haskell
abs :: Int -> Int
abs n = if n >= 0 then n else -n

```
Conditional expressions may be nested, in the sense that they can contain other conditional expressions. For example, the library function `signum` that returns the sign of an integer can be defined as follows:
```Haskell
signum :: Int -> Int
signum n = if n < 0 then -1 else 
              if n == 0 then 0 else 1

```
Note that unlike in some programming languages, conditional expressions in Haskell must always have an `else` branch, which avoids the well-known *dangling else* problem. For example, if `else` branches were optional, then the expression `if True then if False then 1 else 2` could either return the result `2` or produce an error, depending upon whether the single `else` branch was assumed to be part of the inner or outer conditional expression.

##  Guarded equations
As an alternative to using conditional expressions, functions can also be defined using *guarded equations*, in which a sequence of logical expressions called *guards* is used to choose between a sequence of results of the same type. If the first guard is `True`, then the first result is chosen; otherwise, if the second is `True`, then the second result is chosen, and so on. For example, the library function `abs` can also be defined using guarded equations as follows:
```Haskell
abs :: Int -> Int
abs n | n >= 0    = n
      | otherwise = -n

```
The symbol `|` is read as *such that*, and the guard `otherwise` is defined in the standard prelude simply by `otherwise = True`. Ending a sequence of guards with `otherwise` is not necessary, but provides a convenient way of handling all other cases, as well as avoiding the possibility that none of the guards in the sequence is `True`, which would otherwise result in an error.

The main benefit of guarded equations over conditional expressions is that definitions with multiple guards are easier to read. For example, the library function `signum` is easier to understand when defined as follows:
```Haskell
signum :: Int -> Int
signum n | n < 0     = -1
         | n == 0    = 0
         | otherwise = 1

 ``` 

## Pattern matching
Many functions have a simple and intuitive definition using *pattern matching*, in which a sequence of syntactic expressions called *patterns* is used to choose between a sequence of results of the same type. If the first pattern is *matched*, then the first result is chosen; otherwise, if the second is matched, then the second result is chosen, and so on. For example, the library function `not` that returns the negation of a logical value can be defined as follows:
```Haskell
not :: Bool -> Bool
not False = True
not True  = False

```
Functions with more than one argument can also be defined using pattern matching, in which case the patterns for each argument are matched in order within each equation. For example, the library operator `&&` that returns the conjunction of two logical values can be defined as follows:
```Haskell
(&&) :: Bool -> Bool -> Bool
(&&) True True   = True
(&&) True False  = False
(&&) False True  = False
(&&) False False = False

```
However, this definition can be simplified by combining the last three equations into a single equation that returns `False` independent of the values of the two arguments, using the *wildcard pattern* `_` that matches any value:
```Haskell
(&&) :: Bool -> Bool -> Bool
True && True = True
_    && _    = False
``` 
This version also has the benefit that, under lazy evaluation, if the first argument is `False`, then the result `False` is returned without the need to evaluate the second argument. In practice, the prelude defines `&&` using equations that have this same property, but make the choice about which equation applies using the value of the first argument only:
```Haskell
(&&) :: Bool -> Bool -> Bool
True  && b = b
False && _ = False

```
That is, if the first argument is `True`, then the result is the value of the second argument, and, if the first argument is `False`, then the result is `False`.

Note that Haskell does not permit the same name to be used for more than one argument in a single equation. For example, the following definition for the operator `&&` is based upon the observation that, if the two logical arguments are equal, then the result is the same value, otherwise the result if `False`, but is invalid because of the above naming requirement:
```Haskell
(&&) :: Bool -> Bool -> Bool
b && b = b
_ && _ = False

```
If desired, however, a valid version of this definition can be obtained by using a guard to decide if the two arguments are equal:
```Haskell
(&&) :: Bool -> Bool -> Bool
b && c | b == c    = b
       | otherwise = False

```
So far, we have only considered basic patterns that are either values, variables, or the wildcard pattern. In the remainder of this section we introduce two useful ways to build larger patterns by combining smaller patterns.

### Tuple patterns
A tuple of patterns is itself a pattern, which matches any tuple of the same arity whose components all match the corresponding patterns in order. For example, the library  functions `fst` and `snd` that respectively select the first and second components of a pair are defined as follows:
```Haskell
fst :: (a,b) -> a
fst (x,_) = x

snd :: (a,b) -> b
snd (_,y) = y

```

### List patterns
Similarly, a list of patterns is itself a pattern, which matches any list of the same length whose elements all match the corresponding patterns in order. For example, a function `test` that decides if a list contains precisely three characters beginning with the letter `'a'` can be defined as follows:
```Haskell
test :: [Char] -> Bool
test ['a',_,_] = True
test _         = False
```
