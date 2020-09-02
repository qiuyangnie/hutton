fac :: Int -> Int
fac = \n -> product [1..n]

fac' :: Int -> Int
fac' 1 = 1
fac' n = n * fac' (n-1)
