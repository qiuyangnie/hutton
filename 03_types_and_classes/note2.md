A ***class*** is a collection of types that support certain overloaded operations called ***methods***.

#### `Eq`  - equality types
* This class contains types whose values can be compared for equality and inequality using the following two methods:
```Haskell
(==) :: Eq a => a -> a -> Bool

(/=) :: Eq a => a -> a -> Bool
```

#### `Ord` - ordered types
* This class contains types that are instances of the equality class `Eq`, but in addition whose values are totally (linearly) ordered, and as such can be compared and processed using the following six methods:
```Haskell
(<) :: Ord a => a -> a -> Bool

(<=) :: Ord a => a -> a -> Bool

(>) :: Ord a => a -> a -> Bool

(>=) :: Ord a => a -> a -> Bool

min :: Ord a => a -> a -> a

max :: Ord a => a -> a -> a
```

#### `Show` - showable types
* This class contains types whose values can be converted into strings of characters using the following method:
```Haskell
show :: Show a => a -> String
```

#### `Read` - readable types
* This class is dual to `Show`, and contains types whose values can be converted from strings of characters using the following method:
```Haskell
read :: Read a => String -> a
```

#### `Num` - numeric types
* This class contains types whose values are numeric, and as such can be processed using the following six methods:
```Haskell
(+) :: Num a => a -> a -> a

(-) :: Num a => a -> a -> a

(*) :: Num a => a -> a -> a

negate :: Num a => a -> a

abs :: Num a => a -> a

signum :: Num a => a -> a
```
* Note that the `Num` class does not provide a division method, but as we shall now see, division is handled separately using two special classes, one for integral numbers and one for fractional numbers.

#### `Integral` - integral types
* This class contains types that are instances of the numeric class `Num`, but in addition whose values are integers, and as such support the methods of integer division and integer remainder:
```Haskell
div :: Integral a => a -> a -> a

mod :: Integral a => a -> a -> a
```

#### `Fractional` - fractional types
* This class contains types that are instances of the numeric class `Num`, but in addition whose values are non-integral, and as such support the methods of fractional division and fractional reciprocation:
```haskell
(/) :: Fractional a => a -> a -> a

recip :: Fractional a => a -> a
```
