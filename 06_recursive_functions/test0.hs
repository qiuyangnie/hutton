fac :: Int -> Int
fac = \n -> product [1..n]

fac' :: Int -> Int
fac' 1 = 1
fac' n = n * fac' (n-1)

-- For n = 0, the definition of n! as a product involves the product of no numbers at all, and so is an example of the broader convention that the product of no factors is equal to the multiplicative identity (see Empty product).
fac'' :: Int -> Int
fac'' 0 = 1                     -- one is the identity for multiplication.
fac'' n = n * fac''(n-1)

product' :: Num a => [a] -> a
product' []     = 1
product' (n:ns) = n * product' ns
