-- Decide if an integer is even:
even :: Integral a => a -> Bool
even n = n `mod` 2 == 0

-- Split a list at the nth element:
splitAt :: Int -> [a] -> ([a],[a])
splitAt n xs = (take n xs, drop n xs)

-- Reciprocation
recip :: Fractional a => a -> a
recip n = 1/n


abs :: Int -> Int
abs n = if n >= 0 then n else -n

signum :: Int -> Int
signum n = if n < 0 then -1 else
              if n == 0 then 0 else 1
              