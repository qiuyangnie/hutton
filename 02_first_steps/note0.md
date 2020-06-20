# First steps

## Glasgow Haskell Compiler
In practice, we usually require a system that can execute programs automatically. *Glasgow Haskell Compiler* is a state-of-the-art, open source implementation of Haskell. 
* The system has two main components: a batch compiler called GHC, and an interactive interpreter called GHCi. 
* If greater performance or a stand-alone executable version of a Haskell program is required, the compiler itself can be used.
* Once installed, the interactive GHCi system can be started from the terminal command prompt, such as `$`, by simply typing `ghci`: 
```Shell
$ ghci
```
* The GHCi prompt `>` indicates that the system is now waiting for the user to enter an expression to be evaluated. For example, it can be used as a calculator to evaluate simple numeric expressions.

Following normal mathematical convention, in Haskell exponentiation is assumed to have higher priority than multiplication and division, which in turn have higher priority than addition and subtraction. For example, `2*3^4` means `2*(3^4)`, while `2+3*4` means `2+(3*4)`. Moreover, exponentiation associates (or brackets) to the right, while the other four main arithmetic operators associates to the left. For example, `2^3^4` means `2^(3^4)`, while `2-3+4` means `(2-3)+4`. In practice, however, it is often clearer to use explicit parentheses in such expressions, rather than relying on the above rules. 

## Standard prelude
Haskell comes with a large number of built-in functions, which are defined in a library file called the *standard prelude*. In addition to familiar numeric functions such as `+` and `*`, the prelude also provides a range of useful functions that operate on lists. In Haskell, the elements of a list are enclosed in square parentheses and are separated by commas, as in `[1,2,3,4,5]`. 

## Function application
In mathematics, the application of a function to its arguments is usually denoted by enclosing the arguments in parentheses, wile the multiplication of two values is often denoted silently, by writing the two values next to one another.
Reflecting its central status in the language, function application in Haskell is denoted silently using spacing, while the multiplication of two values is denoted explicitly using the operator `*`. For example: `f a b + c*d`.
Moreover, function application has higher priority than all other operators in the language. For example, `f a + b` means `(f a) + b` rather than `f (a + b)`.

## Haskell scripts
New functions are defined in a *script*, a text file comprising a sequence of definitions. By convention, Haskell scripts usually have a `.hs` suffix on their filename to differentiate them from other kinds of files. This is not mandatory, but is useful for identification purposes.

### My first script
`test.hs`

### Naming requirements
By convention, list arguments in Haskell usually have the suffix `s` on their name to indicate that they may contain multiple values. For example, a list of numbers might be named as `ns`, a list of arbitrary values might be named as `xs`, and a list of lists of characters might be named as `css`.
