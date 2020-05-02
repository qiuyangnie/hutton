### Function application
* In mathematics, the application of a function to its arguments is usually denoted by enclosing the arguments in parentheses, while the multiplication of two values is often denoted silently, by writing the two values next to one another.
  * For example, in mathematics the expression f(a,b) + cd means apply the function f to two arguments a and b, and add the result to the product of c and d.
* Reflecting its central status in the language, 
  * function application in Haskell is denoted silently using spacing, while the multiplication of two values is denoted explicitly using the operator `*`.
  * For example, the expression above would be written in Haskell as follows:
```Haskell
f a b + c*d
```

* Moreover, function application has higher priority than all other operators in the language.
  * For example, 
```Haskell
f a + b
(f a) + b

```

### Haskell scripts
* New functions are defined in a **script**, a text file comprising a sequence of definitions.
* We start a text editor and type in the following two function definitions, and save the script to a file called `test.hs`.
```Haskell
double x = x + x
quadruple x = double (double x)
factorial n = product [1..n]
average ns = sum ns `div` length ns
average ns = div (sum ns) (length ns)

```
* In general, any functions with two arguments can be written between its arguments by enclosing the name of the function in single back quotes \`\`.
