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
