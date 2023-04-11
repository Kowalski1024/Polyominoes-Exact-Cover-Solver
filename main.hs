import System.IO;
import System.Environment;
import Polyominoes;
import ExactCover;

main = do
    (firstArg:_) <-getArgs
    content <- readFile firstArg
    let linesOfFiles = lines content
    let targetPolyomino = (read (head linesOfFiles) :: [(Int, Int)])
    let polyominoes = [(read line :: [(Int, Int)]) | line <- tail linesOfFiles]
    print (solve (piecesToMatrix targetPolyomino polyominoes) (length targetPolyomino))
