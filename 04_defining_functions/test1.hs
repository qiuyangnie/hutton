halve :: [a] -> ([a],[a])
halve xs = if even (length xs) then (take ((length xs) `div` 2) xs,drop ((length xs) `div` 2) xs) 
           else ([],[])

abs :: Int -> Int
abs = \n -> if n >= 0 then n else -n 

signum :: Int -> Int
signum = \n -> if n < 0 then -1 else
            if n == 0 then 0 else 1

abs' :: Int -> Int
abs' n | n >= 0    = n
       | otherwise = -n

signum' :: Int -> Int
signum' n | n < 0     = -1
          | n == 0    = 0
          | otherwise = 1

not' :: Bool -> Bool
not' False = True
not' True  = False

-- (&&) :: Bool -> Bool -> Bool
-- (&&) True True   = True
-- (&&) True False  = False
-- (&&) False True  = False
-- (&&) False False = False

-- can be defined more compactly by
-- (&&) :: Bool -> Bool -> Bool
-- (&&) True True = True
-- (&&) _ _       = False

-- however, the following definition is more efficient, 
-- because it avoids evaluating the second argument if the first argument is False:
(&&) :: Bool -> Bool -> Bool
(&&) True b  = b
(&&) False _ = False

-- the underscore symbol _ is a wildcard pattern that matches any argument value.

-- List Patterns
-- Internally, every non-empty list is constructed by repeated use of an operator (:) called "cons" that adds an element to the start of a list.
aList    = 1:(2:(3:(4:[])))
aList'   = [1,2,3,4]
aList''  = 1:2:3:4:[]
aList''' = (:) 1 ((:) 2 ((:) 3 ((:) 4 [])))

-- Functions on lists can be defined using x:xs patterns.
-- head and tail map any non-empty list to its first and remaining elements.
-- x:xs patterns must be parenthesised, because application has priority over (:).
head' :: [a] -> a
head' (x:_) = x

tail' :: [a] -> [a]
tail' (_:xs) = xs

-- Lambda Expressions
-- Functions can be constructed without naming the functions by using lambda expressions.
-- Why are lambda's useful?

-- 1. Lambda expressions can be used to give a formal meaning to functions defined using currying. For example:
add :: Int -> Int -> Int
add x y = x+y
-- means
add' :: Int -> Int -> Int
add' = \x -> (\y -> x + y)

-- 2. Lambda expressions can be used to avoid naming functions that are only referenced once. For example:
odds :: Int -> [Int]
odds n = map f [0..n-1]
         where 
            f x = x*2 + 1
-- can be simplified to
odds' :: Int -> [Int]
odds' n = map (\x -> x*2 + 1) [0..n-1]

-- Operator Sections
-- An operator written between its two arguments can be converted into a curried function written before its two arguments by using parentheses. For example:
-- This convention also allows one of arguments of the operator to be included in the parentheses.
-- In general, if + is an operator then functions of the form (+), (x+) and (+y) are called sections.
-- Why are sections useful?
-- Useful functions can sometimes be constructed in a simple way using sections. For example:
succ :: Int -> Int
succ = (1+)

recip :: Double -> Double
recip = (1/)

double :: Int -> Int
double = (*2)

halving :: Double -> Double
halving = (/2)
