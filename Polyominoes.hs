module Polyominoes where
import Matrix;

type Block = (Int, Int)
type Piece = [Block]


blockInclusion :: Piece -> Block -> Bool
blockInclusion [] _ = False
blockInclusion (b:bs) x
    | fst x == fst b && snd x == snd b = True
    | otherwise = blockInclusion bs x

pieceInclusion :: Piece -> Piece -> Bool
pieceInclusion _ [] = True
pieceInclusion target (b:bs) 
    | not (blockInclusion target b) = False
    | otherwise = pieceInclusion target bs


pieceArrangement :: Block -> Piece -> Piece
pieceArrangement pos bs = [(fst b + fst pos, snd b + snd pos) | b <- bs]


possibleArrangements :: Piece -> Piece -> [Piece]
possibleArrangements _ [] = []
possibleArrangements target (b:bs) =
    let tiles = [(fst tile - fst b, snd tile - snd b) | tile <- b:bs]
    in [arrangement | tb <- target, let arrangement = pieceArrangement tb tiles, pieceInclusion target arrangement]

allPossibleArrangements :: Piece -> [Piece] -> [Piece]
allPossibleArrangements _ [] = []
allPossibleArrangements target (p:ps) = possibleArrangements target p ++ allPossibleArrangements target ps


piecesToMatrix :: Piece -> [Piece] -> Matrix
piecesToMatrix target ps = [pieceToVector target p | p <- allPossibleArrangements target ps]

pieceToVector :: Piece -> Piece -> Vector
pieceToVector target piece = [block `elem` piece | block <- target]

        