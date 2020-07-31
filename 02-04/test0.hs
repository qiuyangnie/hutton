-- Type variables must begin with a lower-case letter, and are usually named a, b, c, etc.
length :: [a] -> Int
length = \xs -> Prelude.length xs
