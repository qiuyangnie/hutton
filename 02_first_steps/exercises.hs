{- 
In general, any function with two arguments can be written between its arguments 
by enclosing the name of the function in single back quotes ``.
-}

n = a `div` length xs
    where
       a = 10
       xs = [1,2,3,4,5]

-- Last element of a non-empty list:
last xs = head (reverse xs)

{-
last xs = xs !! (length xs - 1)
-}

-- Removes the last element from a non-empty list:
init xs = take (length xs - 1) xs

{-
init xs = reverse (drop 1 (reverse xs)) 
-}
