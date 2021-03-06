data BookInfo = Book Int String [String]
                deriving Show

data MagazineInfo = Magazine Int String [String]
                    deriving Show

myInfo :: BookInfo
myInfo = Book 9780135072455 "Algebra of Programming" ["Richard Bird", "Oege de Moor"]

data BookReview = BookReview BookInfo CustomerID String
