module ExactCover (solve) where
import Matrix;

-- Implement the algorithm described in https://en.wikipedia.org/wiki/Knuth%27s_Algorithm_X
solve :: Matrix -> Int -> Bool

solve _ 0 = True
solve [] _ = False
solve [[]] _ = False

solve m columnsLength = fst c > 0 && or [solve' i (m, columnsLength) | (_, i) <- c:cs]
    where 
        c:cs = sortedColumns m
    

solve' :: Int -> (Matrix, Int) -> Bool
solve' i (matrix, columnsLength) = or [uncurry solve (cover row (matrix, columnsLength)) | x <- column, let row = getTrueIndexes (getRow x matrix)]
    where 
        column = getTrueIndexes (getColumn i matrix)


cover :: [Int] -> (Matrix, Int) -> (Matrix, Int)
cover indexes (matrix, columnsLength) = (deleteColumns indexes [row | row <- matrix, not (any (row !!) indexes)], columnsLength - length indexes)
