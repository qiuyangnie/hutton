# Defining functions

## New from old
Perhaps the most straightforward way to define new functions is simply by combining one or more existing functions. For example, a few library functions that can be defined in this way are shown below.

```Haskell
-- Decide if an integer is even:
even :: Integral a => a -> Bool
even n = n `mod` 2 == 0

-- Split a list at the nth element:
splitAt :: 
```

