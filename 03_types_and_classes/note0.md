# Types and classes

## Basic concepts
A *type* is a collection of related values. For example, the type `Bool` contains the two logical values `False` and `True`, while the type `Bool -> Bool` contains all functions that map arguments from `Bool` to results from `Bool`, such as the logical negation function `not`.

We use the notation `v :: T` to mean that `v` is a value in the type `T`, and say that `v` *has type* `T`. For example:
```Haskell
False :: Bool

True :: Bool

not :: Bool -> Bool

```
More generally, the symbol `::` can also be used with expressions that have not yet been evaluated, in which case the notation `e :: T` means that evaluation of the expression `e` will produce a value of type `T`. For example:
```Haskell
not False :: Bool

not True :: Bool

not (not False) :: Bool

```
In Haskell, every expression must have a type, which is calculated prior to evaluating the expression by a process called *type inference*. The key to this process is the following simple typing rule for function application, which states that if `f` is a function that maps arguments of type `A` to results of type `B`, and `e` is an expression of type `A`, then the application `f e` has type `B`:
```Haskell
f :: A -> B
e :: A
f e :: B

not :: Bool -> Bool
False :: Bool
not False :: Bool
```
On the other hand, the expression `not 3` does not have a type under the above rule, because this would require that `3 :: Bool`, which is not valid because `3` is not a logical value. Expressions such as `not 3` that do not have a type are said to contain a *type error*, and are deemed to be invalid expressions.

Because type inference precedes evaluation, Haskell programs are *type safe*, in the sense that type errors can never occur during evaluation. In practice, type inference detects a very large class of program errors, and is one of the most useful features of Haskell. Note, however, that the use of type inference does not eliminate the possibility that other kinds of error may occur during evaluation. For example, the expression ```1 `div` 0``` is well-typed, but produces an error when evaluated because the result of division by zero is undefined.

The downside of type safety is that some expressions that evaluate successfully will be rejected on type grounds. For example, the conditional expression `if True then 1 else False` evaluates to the number `1`, but contains a type error and is hence deemed invalid. In particular, the typing rule for a conditional expression requires that both possible results have the same type, whereas in this case the first such result, `1`, is a number and the second, `False`, is a logical value. In practice, however, programmers quickly learn how to work within the limits of the type system and avoid such problems.

In GHCi, the type of any expression can be displayed by preceding the expression by the command `:type`. 

## Basic types
Haskell provides a number of basic types that are built-in to the language, of which the most commonly used are described below.

### `Bool` - logical values
This type contains the two logical values `False` and `True`.

### `Char` - single charters
This type contains all single characters in the Unicode system, the international standard for representing text-based information. For example, it contains all characters on a normal English keyboard, such as `'a'`, `'A'`, `'3'` and `'_'`, as well as a number of control characters that have a special effect, such as `'\n'` (move to a new line) and `'\t'` (move to the next tab stop). As in most programming languages, single characters must be enclosed in single forward quotes `' '`.

### `String` - strings of characters
This type contains all sequence of characters, such as `"abc"`, `"1+2=3"`, and the empty string `""`. Again, as in standard in most programming languages, strings of characters must be enclosed in double quotes `" "`.

### `Int` - fixed-precision integers
This type contains integers such as `-100`, `0`, and `999`, with a fixed amount of memory being used for their storage. For example, the GHC system has values of type `Int` in the range -2^63 to 2^63 - 1. Going outside this range can give unexpected results. For example, evaluating `2^63 :: Int` gives a negative number as the result, which is incorrect. (The use of `::` in this example forces the result to be an `Int` rather than some other numeric type.)

### `Integer` - arbitrary-precision integers
This type contains all integers, with as much memory as necessary being used for their storage, thus avoiding the imposition of lower and upper limits on the range of numbers. For example, evaluating `2^63 :: Integer` using any Haskell system will produce the correct result.

Apart from the different memory requirements and precision for numbers of type `Int` and `Integer`, the choice between these two types is also one of performance. In particular, most computers have built-in hardware for fixed-precision integers, whereas arbitrary-precision integers are usually processed using the slower medium of software, as sequences of digits.

### `Float` - single-precision floating-point numbers
This type contains numbers with a decimal point, such as `-12.34`, `1.0`, and `3.1415927`, with a fixed amount of memory being used for their storage.

The term *floating-point* comes from the fact that the number of digits permitted after the decimal point depends upon the size of the number. For example, evaluating `sqrt 2 :: Float` using GHCi gives the result `1.4142135` (the library function `sqrt` calculates the square root of a floating-point number), which has seven digits after the decimal point, whereas `sqrt 99999 :: Float` gives `316.2262`, which only has four digits after the point.

### `Double` - double-precision floating-point numbers
This type is similar to `Float`, except that twice as much memory is used for storage of these numbers to increase their precision. For example, evaluating `sqrt 2 :: Double` gives `1.4142135623730951`. Using floating-point numbers is a specialist topic that requires a careful treatment of rounding errors.

## List types
A *list* is a sequence of *elements* of the same type, with the elements being enclosed in square parentheses and separated by commas. We write `[T]` for the type of all lists whose elements have type `T`. For example:
```Haskell
[False,True,False] :: [Bool]

['a','b','c','d'] :: [Char]

["One","Two","Three"] :: [String]

```
The number of elements in a list is called its *length*. The list `[]` of length zero is called the empty list, while lists of length one, such as `[False]`, `['a']`, and `[[]]` are called singleton lists. Note that `[[]]` and `[]` are different lists, the former being a singleton list comprising the empty list as its only element, and the latter being simply the empty list that has no elements.

There are three further points to note about list types. First of all, the type of a list conveys no information about its length. For example, the lists `[False,True]` and `[False,True,False]` both have type `[Bool]`, even though they have different lengths. Secondly, there are no restrictions on the type of the elements of a list. At present we are limited in the range of examples that we can give because the only non-basic type that we have introduced at this point is list types, but we can have lists of lists, such as:
```Haskell
[['a','b'],['c','d','e']] :: [[Char]]

```
Finally, there is no restriction that a list must have a finite length. In particular, due to the use of lazy evaluation in Haskell, lists with an infinite length are both natural and practical.

## Tuple types
A *tuple* is a finite sequence of *components* of possibly different types, with the components being enclosed in round parentheses and separated by commas. We write `(T1,T2,...,Tn)` for the type of all tuples whose `i`th components have type `Ti` for any `i` in the range `1` to `n`. For example: 
```Haskell
(False,True) :: (Bool,Bool)

(False,'a',True) :: (Bool,Char,Bool)

("Yes",True,'a') :: (String,Bool,Char)

```
The number of components in a tuple is called its *arity*. The tuple `()` of arity zero is called the empty tuple, tuples of arity two are called pairs, tuples of arity three are called triples, and so on. Tuples of arity one, such as `(False)`, are not permitted because they would conflict with the use of parentheses to make the evaluation order explicit, such as in `(1+2)*3`.

In a similar manner to list types, there are three further points to note about tuple types. First of all, the type of a tuple conveys its arity. For example, the type `(Bool,Char)` contains all pairs comprising a first component of type `Bool` and a second component of type `Char`. Secondly, there are no restrictions on the types of the components of a tuple. For example, we can now have tuples of tuples, tuples of lists, and lists of tuples:
```Haskell
('a',(False,'b')) :: (Char,(Bool,Char))

(['a','b'],[False,True]) :: ([Char],[Bool])

[('a',False),('b',True)] :: [(Char,Bool)]

```
Finally, note that tuples must have a finite arity, in order to ensure that tuple types can always be inferred prior to evaluation.

## Function types
A *function* is a mapping from arguments of one type to results of another type. We write `T1 -> T2` for the type of all functions that map arguments of type `T1` to results of type `T2`. For example, we have: 
```Haskell
not :: Bool -> Bool

even :: Int -> Bool

```
(The library function `even` decides if an integer is even.) Because there are no restrictions on the types of the arguments and results of a function, the simple notion of a function with a single argument and a single result is already sufficient to handle the case of multiple arguments and results, by packaging multiple values using lists or tuples. For example, we can define a function `add`that calculates the sum of a pair of integers, and a function `zeroto` that returns the list of integers from zero to a given limit, as follow:
```Haskell
add :: (Int,Int) -> Int
add (x,y) = x+y

zeroto :: Int -> [Int]
zeroto n = [0..n]

```
In these examples we have followed the Haskell convention of preceding function definitions by their types, which serves as useful documentation. Any such types provided manually by the user are checked for consistency with the types calculated automatically using type inference.

Note that there is no restriction that functions must be *total* on their argument type, in the sense that there may be some arguments for which the result is not defined. For example, the result of the library function `head` that selects the first element of a list is undefined if the list is empty:
```Shell
Prelude> head []
*** Exception: Prelude.head: empty list

```

## Curried functions
Functions with multiple arguments can also be handled in another, perhaps less obvious way, by exploiting the fact that functions are free to return functions as results. For example, consider the following definition:
```Haskell
add' :: Int -> (Int -> Int)
add' x y = x+y

```
The type states that `add'` is a function that takes an argument of type `Int`, and returns a result that is a function of type `Int -> Int`. The definition itself states that `add'` takes an integer `x` followed by an integer `y`, and returns the result `x+y`. More precisely, `add'` takes an integer `x` and returns a function, which in turn takes an integer `y` and returns the result `x+y`.

Note that the function `add'` produces the same final result as the function `add` from the previous section, but whereas `add` takes its two arguments at the same time packaged as a pair, `add'` takes its two arguments one at a time, as reflected in the different types of the two functions:
```Haskell
add :: (Int,Int) -> Int

add' :: Int -> (Int -> Int)

```
Functions with more than two arguments can also be handled using the same technique, by returning functions that return functions, and so on. For example, a function `mult` that takes three integers `x`, `y` and `z`, one at a time, and returns their product, can be defined as follow:
```Haskell
mult :: Int -> (Int -> (Int -> Int))
mult x y z = x*y*z

```
This definition states that `mult` takes an integer `x` and returns a function, which in turn takes an integer `y` and returns another function, which finally takes an integer `z` and returns the result `x*y*z`.

Functions such as `add'` and `mult` that take their arguments one at a time are called *curried functions*. As well as being interesting in their own right, curried functions are also more flexible than functions on tuples, because useful functions can often be made by partially applying a curried function with less than its full complement of arguments. For example, a function that increments an integer can be given by the partial application `add' 1 :: Int -> Int` of the curried function `add'` with only one of its two arguments.

To avoid excess parentheses when working with curried functions, two simple conventions are adopted. First of all, the function arrow `->` in types is assumed to associate to the right. For example, the type
```Haskell
Int -> Int -> Int -> Int

``` 
means
```Haskell
Int -> (Int -> (Int -> Int))

```
Consequently, function application, which is denoted silently using spacing, is assumed to associate to the left, For example, the application
```Haskell
mult x y z

```
means 
```Haskell
(((mult x) y) z)

```

Unless tupling is explicitly required, all functions in Haskell with multiple arguments are normally defined as curried functions, and the two conventions above are used to reduce the number of parentheses that are required.
