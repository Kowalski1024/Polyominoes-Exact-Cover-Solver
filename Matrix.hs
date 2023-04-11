module Matrix (
    Vector,
    Matrix,
    getColumn,
    getRow,
    deleteColumn,
    deleteColumns,
    deleteRow,
    deleteRows,
    getTrueIndexes,
    sumByRows,
    sortedColumns
) where

type Vector = [Bool]
type Matrix = [Vector]

getColumn :: Int -> Matrix -> Vector
getColumn n m = [row !! n | row <- m]

getRow :: Int -> Matrix -> Vector
getRow n m = m !! n

deleteRow :: Int -> Matrix -> Matrix
deleteRow n m = take n m ++ drop (n+1) m

deleteRows :: [Int] -> Matrix -> Matrix
deleteRows indexes matrix = [row | (row, index) <- zip matrix [0..], index `notElem` indexes]

deleteColumn :: Int -> Matrix -> Matrix
deleteColumn n m = [take n vec ++ drop (n+1) vec | vec <- m]

deleteColumns :: [Int] -> Matrix -> Matrix
deleteColumns _ [] = []
deleteColumns indexes (row:rows) = ([x | (x, index) <- zip row [0..], index `notElem` indexes]) : deleteColumns indexes rows

getTrueIndexes :: Vector -> [Int]
getTrueIndexes vec = [n | (x, n) <- zip vec [0..], x]

sumByRows :: Matrix -> [Int]
sumByRows = foldl (\acc x -> zipWith (+) acc (map fromEnum x)) [0,0..]

sortedColumns :: Matrix -> [(Int, Int)]
sortedColumns m = quickSort (zip (sumByRows m) [0..])

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort (filter (x >) xs) ++ [x] ++ quickSort (filter (x <=) xs)