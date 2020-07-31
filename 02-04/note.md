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

## Conditional Expressions
As in most programming languages, functions can be defined using conditional expressions.

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
