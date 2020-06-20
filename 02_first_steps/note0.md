# First Step

## Glasgow Haskell Compiler
In practice, we usually require a system that can execute programs automatically. *Glasgow Haskell Compiler* is a state-of-the-art, open source implementation of Haskell.
* The system has two main components: a batch compiler called GHC, and an interactive interpreter called GHCi. 
* If greater performance or a stand-alone executable version of a Haskell program is required, the compiler itself can be used.
* Once installed, the interactive GHCi system can be started from the terminal command prompt, such as `$`, by simply typing `ghci`: 
```Shell
$ ghci
```
* The GHCi prompt `>` indicates that the system is now waiting for the user to enter an expression to be evaluated. For example, it can be used as a calculator to evaluate simple numeric expressions.

Following normal mathematical convention, in Haskell exponentiation is assumed to have higher priority than multiplication and division, which in turn have higher priority than addition and subtraction. For example, `2*3^4` means `2*(3^4)`, while `2+3*4` means `2+(3*4)`. Moreover, exponentiation associates (or brackets) to the right, while the other four main arithmetic operators associates to the left. For example, `2^3^4` means `2^(3^4)`, while `2-3+4` means `(2-3)+4`. In practice, however, it is often clearer to use explicit parentheses in such expressions, rather than relying on the above rules.
