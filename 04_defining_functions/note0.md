# Defining functions

## New from old
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
