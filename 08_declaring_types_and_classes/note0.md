# Declaring types and classes
## Type declarations
```Haskell
type String = [Char]
```
```Haskell
type Pos = (Int,Int)

type Trans = Pos -> Pos
```
```Haskell
type Pair a = (a,a)
```
```Haskell
type Assoc k v = [(k,v)]
```
```Haskell
find :: Eq k => k -> Assoc k v -> v
find k t = head [v | (k',v) <- t, k == k'] 
```
```Haskell
data Bool = False | True
```
```Haskell
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
```
