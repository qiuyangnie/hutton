cs = ['a','b','c'] :: [Char]

cs' = ('a','b','c') :: (Char,Char,Char)

ts = [(False,'0'),(True,'1')] :: [(Bool,Char)]

ts' = ([False,True],['0','1']) :: ([Bool],[Char])

xs = [tail,init,reverse] :: [[Int] -> [Int]]

second :: [a] -> a
second xs = head (tail xs)

swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)

pair :: a -> b -> (a,b)
pair x y = (x,y)

double :: Num a => a -> a
double x = x*2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (t -> t) -> t -> t
twice f x = f (f x)

