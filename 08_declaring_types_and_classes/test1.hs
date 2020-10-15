-- Type Declarations:
-- In Haskell, a new name for an existing type can be defined using a type declaration.
type String = [Char]

-- Type declarations can be used to make other types easier to read.
type Pos = (Int,Int)

origin :: Pos
origin = (0,0)

left :: Pos -> Pos
left (x,y) = (x-1,y)

-- Like function definitions, type declarations can also have parameters.
type Pair a = (a,a)

mult :: Pair Int -> Int
mult (m,n) = m*n

copy :: a -> Pair a
copy x = (x,x)

-- Type declarations can be nested.
type Pos'  = (Int,Int)
type Trans = Pos' -> Pos'


-- Data Declarations:
-- A completely new type can be defined by specifying its values using a data declaration.
-- Bool is a new type, with two new values False and True.
-- The two values False and True are called the constructors for the type Bool.
-- Type and constructor names must always begin with an upper-case letter.
-- Data declarations are similar to context free grammars. The former specifies the values of a type, the latter the sentences of a language.
data Bool = False | True        

-- Values of new types can be used in the same ways as those of built in types.
data Answer = Yes | No | Unknown
              deriving Show

flip :: Answer -> Answer
flip Yes     = No
flip No      = Yes
flip Unknown = Unknown

answers :: [Answer]
answers = [Yes,No,Unknown]

-- The constructors in a data declaration can also have parameters.
-- Shape has values of the form Circle r where r is a float, and Rect x y where x and y are floats.
-- Circle and Rect can be viewed as functions that construct values of type Shape: 
-- Circle :: Float -> Shape
-- Rect :: Float -> Float -> Shape
data Shape = Circle Float | Rect Float Float
             deriving Show

square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x*y

-- Not surprisingly, data declarations themselves can also have parameters.
data Maybe' a = Nothing'| Just' a
                deriving Show

safediv :: Int -> Int -> Maybe' Int
safediv m 0 = Nothing'
safediv m n = Just' (m `div` n)

safehead :: [a] -> Maybe' a
safehead [] = Nothing'
safehead xs = Just' (head xs)
