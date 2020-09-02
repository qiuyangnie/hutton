{--
(*) :: Int -> Int -> Int
(*) m 0 = 0
(*) m n = m + (m Main.* (n-1))
--}

product :: Num a => [a] -> a
product []     = 1
product (n:ns) = n * Main.product ns

length :: [a] -> Int
length []     = 0
length (_:xs) = 1 + Main.length xs

reverse :: [a] -> [a]
reverse []     = []
reverse (x:xs) = Main.reverse xs ++ [x]
