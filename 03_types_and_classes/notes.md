## Types and classes

### Basic concepts
* A **type** is a collection of related values.
  * The type `Bool` contains the two logical values `False` and `True`.
  * The type `Bool -> Bool` contains all functions that map arguments from `Bool` to results from `Bool`.
    * E.g., the logical negation function `not`.
* We use the notation `v :: T` to mean that `v` is a value in the type `T`, and say that `v` has type `T`.
  * E.g., 
  ```Haskell
  False :: Bool
  True :: Bool
  not :: Bool -> Bool

  ```
* The symbol `::` can also be used with expressions that have not yet been evaluated, in which case the notation `e :: T` means that evaluation of the expression `e` will produce a value of type `T`.
  * E.g.,
  ```Haskell
  not False :: Bool
  not True :: Bool
  not (not False) :: Bool

  ```

* In Haskell, every expression must have a type, which is calculated prior to evaluating the expression by a process called **type inference**.
  * Simple typing rule for function application:
    * If `f` is a function that maps arguments of type `A` to results of type `B`, and `e` is an expression of type `A`, then the application `f e` has type `B`.
      * E.g., the typing `not False :: Bool` can be inferred from this rule using the fact that
        * `not :: Bool -> Bool` and 
        * `False :: Bool`.
      * E.g., the expression `not 3` does not have a type under the above rule, because:
        * `not :: Bool -> Bool` and
        * `3 :: Bool` is not valid because `3` is not a logical value.
          * Expressions such as `not 3` that do not have a type are said to contain a **type error**, and are deemed to be invalid expressions.

* Because type inference precedes evaluation, Haskell programs are **type safe**, in the sense that type errors can never occur during evaluation.
* The downside of type safety is that some expressions that evaluate successfully will be rejected on type grounds.
  * E.g., the conditional expression `if True then 1 else False` evaluates to the number `1`, but contains a type error and is hence deemed invalid.
    * In particular, the typing rule for a conditional expression requires that both possible results have the same type, whereas in this case the first such result, `1`, is a number and the second, `False`, is a logical value.
      * In practice, however, programmers quickly learn how to work within the limits of the type system and avoid such problems.

* In GHCi, the type of any expression can be displayed by preceding the expression by the command `:type`.
  * E.g.,
  ```Scala
  Prelude> :type not
  not :: Bool -> Bool
  Prelude> :type False
  False :: Bool
  Prelude> :type not False
  not False :: Bool

  ```


