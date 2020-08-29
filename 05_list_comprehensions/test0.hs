import Data.Char

let2int :: Char -> Int
let2int = \c -> ord c - ord 'a'

int2let' :: Int -> Char
int2let' = \n -> chr (n + ord 'a')

-- hard code `97` (ord 'a') is a bad example
int2let :: Int -> Char
int2let = \n -> if n < 0 || n > 25 then '0'
            else chr (n + 97)

shift :: Int -> Char -> Char
shift f c = int2let (mod (let2int c + f) 26)

shift' :: Int -> Char -> Char
shift' n c | isLower c = int2let (mod (let2int c + n) 26)
           | otherwise = c

encode :: Int -> [Char] -> [Char]
encode = \n -> \xs -> [shift' n x | x <- xs]

encode' :: Int -> String -> String
encode' = \n -> \xs -> [shift' n x | x <- xs]
