## The Standard Prelude

## Polymorphic Functions
```Shell
> :t fst
fst :: (a, b) -> a

> :t head
head :: [a] -> a

> :t take
take :: Int -> [a] -> [a]

> :t zip
zip :: [a] -> [b] -> [(a, b)]

> :t id
id :: a -> a

```

## Overloaded Functions
A polymorphic function is called overloaded if its type contains one or more class constraints.
```Shell
> :t (+)
(+) :: Num a => a -> a -> a

```
Haskell has a number of type classes, including:
* `Num` - numeric types
* `Eq`  - Equality types
* `Ord` - Ordered types
```Shell
> :t (==)
(==) :: Eq a => a -> a -> Bool

> :t (<)
(<) :: Ord a => a -> a -> Bool

```

## Function Types
A function is a mapping from values of one type to values of another type:
```Haskell
not :: Bool -> Bool

even :: Integral a => a -> Bool

```
In general, `t1 -> t2` is the type of functions that map values of type `t1` to values of type `t2`.

The argument and result types are unrestricted. For example, functions with multiple arguments or results are possible using lists or tuples:
```Haskell
add :: (Int,Int) -> Int
add = \(x,y) -> x+y

zeroto :: Int -> [Int]
zeroto = \n -> [0..n]

```

## Conditional Expressions
As in most programming languages, functions can be defined using conditional expressions.

## Guarded Equations
As an alternative to conditionals, functions can also be defined using guarded equations.

## Basic classes
Recall that a type is a collection of related values. Building upon this notion, a *class* is a collection of types that support certain overloaded operations called *methods*.

### `Eq` - equality types
This class contains types whose values can be compared for equality and inequality using the following two methods:
```Haskell
(==) :: a -> a -> Bool

(/=) :: a -> a -> Bool

```
All the basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Eq` class, as are list and tuple types, provided that their element and component types are instances. For example:
```Shell
> False == False
True

> 'a' == 'b'
False

> "abc" == "abc"
True

> [1,2] == [1,2,3]
False

> ('a',False) == ('a',False)
True

```
Note that function types are not in general instances of the `Eq` class, because it is not feasible in general to compare two functions for equality.

## `Ord` - ordered types
This class contains types that are instances of the equality class `Eq`, but in addition whose values are totally (linearly) ordered, and as such can be compared and processed using the following six methods:
```Haskell
(<) :: a -> a -> Bool

(<=) :: a -> a -> Bool

(>) :: a -> a -> Bool

(>=) :: a -> a -> Bool

min :: a -> a -> a

max :: a -> a -> a

```
All the basic types `Bool`, `Char`, `String`, `Int`, `Integer`, `Float`, and `Double` are instances of the `Ord` class, as are list types and tuple types, provided that their element and component types are instances. For example:
```Haskell
> False < True
True

> min 'a' 'b'
'a'

> "elegant" < "elephant"
True

> [1,2,3] < [1,2]
False

> ('a',2) < ('b',1)
True

> ('a',2) < ('a',1)
False

```
Note that strings, lists and tuples are ordered *lexicographically*; that is, in the same way as words in a dictionary. For example, two pairs of the same type are in order if their first components are in order, in which case their second components are not considered, or if their first components are equal, in which case their second components must be in order.
