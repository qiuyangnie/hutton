## Glasgow Haskell Compiler
* In practice, we usually require a system that can execute programs automatically.
* State-of-the-art, open source implementation of Haskell.
* Two main components:
  * A batch compiler (GHC)
  * An interactive interpreter (GHCi)

## Starting
* The GHCi prompt `>` indicates that the system is now waiting for the user to enter an **expression** to be evaluated.
* Following normal mathematical convention,
  * In Haskell **exponentiation** is assumed to have higher priority than **multiplication** and **division**, which in turn have higher priority than **addition** and **subtraction**.
    * E.g., `2*3^4` means `2*(3^4)`, while `2+3*4` means `2+(3*4)`.
  * Moreover, exponentiation associates to the right, while the other four main arithmetic operators associate to the left.
    * E.g., `2^3^4` means `2^(3^4)`, while `2-3+4` means `(2-3)+4`.
  * In practice, however, it is often clearer to use explicit parentheses in such expressions, rather than relying on the above rules.

## Standard prelude
* Haskell comes with a large number of built-in functions, which are defined in a library file called the **standard prelude**.

## The difference between function application in mathematics and in Haskell
* In mathematics, **the application of a function to its arguments** is usually denoted by enclosing the arguments in parentheses, while the multiplication of two values is often denoted silently, by writing the two values next to one another.
  * E.g., in mathematics, the expression f(a,b) + cd means
    * apply the function f to two arguments a and b, and add the result to the product of c and d.
* **Function application in Haskell is denoted silently using spacing**, while the multiplication of two values is denoted explicitly using the operator \*.
  * E.g., `f a b + c*d`.
  * Function application has higher priority than all other operators in the language.
    * E.g., `f a + b` means `(f a) + b` rather than `f (a + b)`.

## Haskell scripts

### My first script
* New functions are defined in a **script**, a text file composing a sequence of definitions.
* By convention, Haskell scripts usually have a `.hs` suffix on their filename to differentiate them from other kinds of files. 
  * This is not mandatory, but is useful for identification purposes.
```Haskell
double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]

average ns = sum ns `div` length ns

```
* In general, any function with two arguments can be written between its arguments by enclosing the name of the function in single back quotes \`\`.
```Haskell
average ns = div (sum ns) (length ns)
```
```Unix
➜  ~ git:(master) ✗ ghci test.hs 
GHCi, version 8.8.3: https://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Main             ( test.hs, interpreted )
Ok, one module loaded.
*Main> quadruple 10
40
*Main> take (double 2) [1,2,3,4,5]
[1,2,3,4]
*Main> :r
Ok, one module loaded.
*Main> factorial 10
3628800
*Main> average [1,2,3,4,5]
3
```

### Naming requirements
* When defining a new function, the names of the function and its arguments must begin with a lower-case letter, but can then be followed by zero or more letters (both lower- and upper-case), digits, underscores, and forward single quotes.
  * E.g., `myFun, fun1, arg_2, x'`
* **Keywords** have a special meaning in the language, and cannot be used as the names of functions or their arguments.
* By convention, list arguments in Haskell usually have the suffix `s` on their name to indicate that they may contain multiple values.
  * For example, a list of numbers might be named as `ns`, a list of arbitrary values might be named `xs`, and a list of lists of characters might be named as `css`.


### The layout rule
* Within a script, each definition at the same level must begin in precisely the same column.
  * This **layout rule** makes it possible to determine the grouping of definitions from their indentation.
```Haskell
a = b + c
    where
       b = 1
       c = 2
d = a * 2

```
* `b` and `c` are local definitions for use within the body of `a`.
  * If desired, such grouping can be made explicit by enclosing a sequence of definitions in curly parentheses and separating each definition by a semi-colon.
```Haskell
a = b + c
    where
       {b = 1;
        c = 2};
d = a * 2

```
* or even be combined into a single line:
```Haskell
a = b + c where {b = 1; c = 2}; d = a * 2

```
* In general, however, it is usually preferable to rely on the layout rule to determine the grouping of definitions, rather than using explicit syntax.

### Tabs
* Tab characters can cause problems in scripts, because layout is significant but different text editors interpret tabs in different ways.
  * For this reason, it is recommended to avoid using tabs when indenting definitions, and the GHC system issues a warning message if they are used. 
* Haskell assumes that tab stops are 8 characters wide.

### Comments
* Two kinds of comments:
  * **ordinary**
  * **nested**
```Haskell
-- Factorial of a positive integer:
factorial n = product [1..n]

-- Average of a list of integers:
average ns = sum ns `div` length ns

```
```Haskell
{-
double x = x + x

quadruple x = double (double x)
-}

```
