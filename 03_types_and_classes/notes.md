## Types and classes
### Basic concepts
* A **type** is a collection of related values.
* For example, the type `Bool` contains the two logical values `False` and `True`, while the type `Bool -> Bool` contains all functions that map arguments from `Bool` to results from `Bool`, such as the logical negation function `not`.
* We use the notation `v :: T` to mean that `v` is a value in the type `T`, and say that `v` has type `T`.
* For example:
```Haskell
False :: Bool
True :: Bool
not :: Bool -> Bool

```
* More generally, the symbol `::` can also be used with expressions that have not yet been evaluated, in which case the notation `e :: T` means that evaluation of the expression `e` will produce a value of type `T`.
* For example:
```Haskell
not False :: Bool
not True :: Bool
not (not False) :: Bool

```
* In Haskell, every expression must have a type, which is calculated prior to evaluating the expression by a process called **type inference**.
* The key to this process is the following simple typing rule for function application, which states that if `f` is a function that maps arguments of type `A` to results of type `B`, and `e` is an expression of type `A`, then the application `f e` has type `B`:
```Haskell
f :: A -> B
e :: A

f e :: B
```
* For example, 
```Haskell
not :: Bool -> Bool
False :: Bool

not False :: Bool
```
* Expressions such as `not 3` that do not have a type are said to contain a **type error**, and are deemed to be invalid expressions.
* Because type inference precedes evaluation, Haskell programs are **type safe**, in the sense that type errors can never occur during evaluation.
* However, the use of type inference does not eliminate the possibility that other kinds of error may occur during evaluation .
* For example, the expression
```Haskell
1 `div` 0
```
is well-typed, but produces an error when evaluated because the result of division by zero is undefined.
* The downside of type safety is that some expressions that evaluate successfully will be rejected on type grounds.
* For example, the conditional expression `if True then 1 else False` evaluates to the number `1`, but contains a type error and is hence deemed invalid.


### Basic types
#### `Bool` - logical values
* This type contains the two logical values `False` and `True`.

#### `Char` - single characters
* This type contains all single characters in the Unicode system, the international standard for representing text-based information.

#### `String` - strings of characters
* This type contains all sequence of characters.

#### `Int` - fixed-precision integers
* This type contains integers such as `-100`, `0`, and `999`, with a fixed amount of memory being used for their storage.

#### `Integer` - arbitrary-precision integers
* This type contains all integers, with as much memory as necessary being used for their storage, thus avoiding the imposition of lower and upper limits on the range of numbers.
* Apart from that, the choice between these two types is also one of performance.
  * In particular, most computers have built-in hardware for fixed-precision integers, whereas arbitrary-precision integers are usually processed using the slower medium of software, as sequences of digits.

#### `Float` - single-precision floating-point numbers
* This type contains numbers with a decimal point, such as `-12.34`, `1.0`, and `3.1415927`, with a fixed amount of memory being used for their storage.
* The term **floating-point** comes from the fact that the number of digits permitted after the decimal point depends upon the size of the number.
* For example, evaluating `sqrt 2 :: Float` using GHCi gives the result `1.4142135` (the library function `sqrt` calculates the square root of a floating-point number), which has seven digits after the decimal point, whereas `sqrt 99999 :: Float` gives `316.2262`, which only has four digits after the point.

#### `Double` - double-precision floating-point numbers
* This type is similar to `Float`, except that twice as much memory is used for storage of these numbers to increase their precision.
* Using floating-point numbers is a specialist topic that requires a careful treatment of rounding errors.


We conclude this section by noting that a single number may have more than one numeric type. For example, the number `3` could have type `Int`, `Integer`, `Float` or `Double`. This raises the interesting question of what type such numbers should be assigned during the process of type inference, which will be answered later in this chapter when we consider type classes.

### List types
* A **list** is a sequence of elements of the same type, with the elements being enclosed in square parentheses and separated by commas. We write `[T]` for the type of all lists whose elements have type `T`. For example:
```Haskell
[False,True,False] :: [Bool]
['a','b','c','d'] :: [Char]
["One","Two","Three"] :: [String]

```
* The number of elements in a list is called its **length**. 
* The list `[]` of length zero is called the empty list, while lists of length one, such as `[False]`, `['a']`, and `[[]]` are called singleton lists.
* There are three further points to note about list types. 
  * First of all, the type of a list conveys no information about its length. For example, the lists `[False,True]` and `[False,True,False]` both have type `[Bool]`, even though they have different lengths.
  * Secondly, there are no restrictions on the type of the elements of a list, such as:
```Haskell
[['a','b'],['c','d','e']] :: [[Char]]
```
* Finally, there is no restriction that a list must have a finite length. In particular, due to the use of lazy evaluation in Haskell, lists with an infinite length are both natural and practical.

### Tuple types
* A **tuple** is a finite sequence of **components** of possibly different types, with the components being enclosed in round parentheses and separated by commas.
* We write `(T1,T2,...,Tn)` for the type of all tuples whose `ith` components have type `Ti` for any `i` in the range `1` to `n`. For example:
```Haskell
(False,True) :: (Bool,Bool)
(False,'a',True) :: (Bool,Char,Bool)
("Yes",True,'a') :: (String,Bool,Char)

```
* The number of components in a tuple is called its **arity**.
* The tuple `()` of arity zero is called the empty tuple, tuples of arity two are called pairs, tuples of arity three are called triples, and so on. Tuples of arity one, such as `(False)`, are not permitted because they would conflict with the use of parentheses to make the evaluation order explicit, such as in `(1+2)*3`.
* There are three further points to note about tuple types.
  * First of all, the type of a tuple conveys its arity. For example, the type `(Bool,Char)` contains all pairs comprising a first component of type `Bool` and a second component of type `Char`.
  * Secondly, there are no restrictions on the types of the components of a tuple. For example:
```Haskell
('a',(False,'b')) :: (Char,(Bool,Char))
(['a','b'],[False,True]) :: ([Char],[Bool])
[('a',False),('b',True)] :: [(Char,Bool)]

```
* Finally, note that tuples must have a finite arity, in order to ensure that tuple types can always be inferred prior to evaluation.




































