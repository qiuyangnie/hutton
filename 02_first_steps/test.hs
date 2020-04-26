double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]

average ns = sum ns `div` length ns

n = a `div` length ns
    where
       a = 10
       ns = [1,2,3,4,5]

my_last_1 ns = drop ((length ns) - 1) ns

my_last_2 ns = ns !! (length ns - 1)

my_last_3 ns = head (reverse ns)

my_init_1 ns = take (length ns - 1) ns

my_init_2 ns = reverse (tail (reverse ns))
