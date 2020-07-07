signum :: Int -> Int
signum n = if n < 0 then -1 else 
              if n == 0 then 0 else 1

signum' :: Int -> Int
signum' n | n > 0     = 1
          | n == 0    = 0
          | otherwise = -1

-- (&&) :: Bool -> Bool -> Bool
-- (&&) True True   = True
-- (&&) True False  = False
-- (&&) False True  = False
-- (&&) False False = False

-- (&&) :: Bool -> Bool -> Bool
-- True && True   = True
-- True && False  = False
-- False && True  = False
-- False && False = False

(&&) :: Bool -> Bool -> Bool
True  && b = b
False && _ = False
