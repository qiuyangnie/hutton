-- Three approaches to declaring types
  -- Type declarations
    -- 1. The simplest way is to introduce a new name for an existing type, using the `type` mechanism of Haskell.
type String = [Char]

type Pos = (Int,Int)
type Trans = Pos -> Pos

type Pair a = (a,a)

type Assoc k v = [(k,v)]

find :: Eq k => k -> Assoc k v -> v
find = \k -> \t -> head [v | (k',v) <- t, k == k']

  -- Data declarations
    -- 2. A completely new type can be declared by specifying its values using the `data` mechanism of Haskell.
data Bool = False | True  -- The symbol `|` is read as or, and the new values of the type are called constructors.
data A = B | C

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
             deriving Show

square :: Float -> Shape
square n = Rect n n

circle :: Float -> Shape
circle r = Circle r

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y

data Maybe' a = Nothing' | Just' a
                deriving Show

safediv :: Int -> Int -> Maybe' Int
safediv _ 0 = Nothing'
safediv m n = Just' (m `div` n)

safehead :: [a] -> Maybe' a
safehead [] = Nothing'
safehead xs = Just' (head xs)

  -- Newtype declarations
    -- 3. If a new type name has a single constructor with a single argument, then it can also be declared using the `newtype` mechanism.
newtype Nat = N Int
type Nat'   = Int 
data Nat''  = N Int

