double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]

average ns = sum ns `div` length ns

n = a `div` length xs
    where 
      a = 10
      xs = [1,2,3,4,5] 

last xs = head (reverse xs)

last' xs = xs !! (length xs - 1)

init xs = reverse (drop 1 (reverse xs))

init' xs = take (length xs - 1) xs
 
