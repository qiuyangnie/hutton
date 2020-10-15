type String = [Char]

type Trans = Pos -> Pos

type Pair a = (a,a)

type Assoc k v = [(k,v)]

find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k',v) <- t, k == k']

data Bool = False | True

type Pos = (Int,Int)

data Move = North | South | East | West
            deriving Show

move :: Move -> Pos -> Pos
move North (x,y) = (x,y+1)
move South (x,y) = (x,y-1)
move East  (x,y) = (x+1,y)
move West  (x,y) = (x-1,y)

moves :: [Move] -> Pos -> Pos
moves []     p = p
moves (m:ms) p = moves ms (move m p)

rev :: Move -> Move
rev North = South
rev South = North
rev East  = West
rev West  = East

data Shape = Circle Float | Rect Float Float

square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y

data Maybe' a = Nothing' | Just' a
                deriving Show

safediv :: Int -> Int -> Maybe' Int
safediv _ 0 = Nothing'
safediv m n = Just' (m `div` n)

safehead :: [a] -> Maybe' a
safehead []    = Nothing'
safehead (x:_) = Just' x
