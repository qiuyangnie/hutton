-- Type variables must begin with a lower-case letter, and are usually named a, b, c, etc.
length :: [a] -> Int
length = \xs -> Prelude.length xs

second :: [a] -> a
second = \xs -> head (tail xs)

swap :: (a,b) -> (b,a)
swap = \(x,y) -> (y,x)

pair :: a -> b -> (a,b)
pair = \x -> \y -> (x,y)

double :: Num a => a -> a
double = \x -> x*2

palindrome :: String -> Bool
palindrome = \xs -> reverse xs == xs

add :: Num a => (a,a) -> a
add = \(x,y) -> x+y

zeroto :: Int -> [Int]
zeroto = \n -> [0..n]

twice :: (t -> t) -> t -> t
twice = \f -> \x -> f (f x)

-- Conditional expressions
abs :: (Ord p, Num p) => p -> p
abs = \n -> if n >= 0 then n else -n

-- Guarded equations can be used to make definitions involving multiple conditions easier to read:
abs' :: (Ord p, Num p) => p -> p
abs' n | n >= 0    = n
       | otherwise = -n

-- Pattern matching
-- Many functions have a particularly clear definition using pattern matching on their arguments.
abs'' :: Num a => a -> a
abs'' n  = n
abs'' -n = n 

safetail :: Eq a => [a] -> [a]
safetail = \xs -> if xs == [] then [] else tail xs

safetail' :: Eq a => [a] -> [a]
safetail' xs | xs == []  = []
             | otherwise = tail xs

safetail'' :: [a] -> [a]
safetail'' [] = []
safetail'' xs = tail xs

safetail''' :: [a] -> [a]
safetail''' = \xs -> if null xs then [] else tail xs

safetail'''' :: [a] -> [a]
safetail'''' xs | null xs   = []
                | otherwise = tail xs
