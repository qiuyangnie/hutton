zip :: [a] -> [b] -> [(a,b)]
zip [] _          = []
zip _ []          = []
zip (x:xs) (y:ys) = (x,y) : Main.zip xs ys

drop :: Int -> [a] -> [a]
drop _ []     = []
drop 0 xs     = xs
drop n (_:xs) = Main.drop (n-1) xs
