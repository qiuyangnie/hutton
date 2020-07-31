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
