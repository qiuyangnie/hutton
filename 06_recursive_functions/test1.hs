{--
(*) :: Int -> Int -> Int
(*) m 0 = 0
(*) m n = m + (m Main.* (n-1))
--}

product :: Num a => [a] -> a
product []     = 1
product (n:ns) = n * Main.product ns
