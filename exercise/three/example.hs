say :: Integer -> String
say n | mod n 3 == 0 && mod n 5 == 0 = "FizzBuzz"
      | mod n 3 == 0                 = "Fizz"
      | mod n 5 == 0                 = "Buzz"
      | otherwise                    = show n

main :: IO()
main = mapM_ putStrLn $ map say [1..100]
