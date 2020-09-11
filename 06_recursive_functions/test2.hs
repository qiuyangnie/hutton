zip' :: [a] -> [b] -> [(a,b)]
zip' [] _          = []
zip' _ []          = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

drop' :: Int -> [a] -> [a]
drop' _ []     = []
drop' 0 xs     = xs
drop' n (_:xs) = drop' (n-1) xs

append :: [a] -> [a] -> [a]
append [] ys         = ys
append (x:xs) ys     = x : (append xs ys)

qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = 
   qsort smaller ++ [x] ++ qsort larger
   where 
      smaller = [a | a <- xs, a <= x]
      larger  = [b | b <- xs, b > x]
