# Polyominoes-Exact-Cover-Solver

This program checks whether a given set of polyominoes can be used to form a specified polyomino. It uses [Knuth's Algorithm X](https://en.wikipedia.org/wiki/Knuth%27s_Algorithm_X), which is a method for solving the [Exact Cover](https://en.wikipedia.org/wiki/Exact_cover) problem in Polyomino tiling.

First, a new set is created from the available polyominoes. This set contains all possible arrangements of the polyominoes in the target polyomino. The target polyomino is the polyomino that needs to be formed. Each polyomino is made up of 1x1 blocks that are arranged on a coordinate plane. Then, based on this set, a False/True matrix is created, which is needed for the X algorithm. This matrix and the size of the target polyomino are provided as input to the algorithm. The algorithm returns either True or False, depending on whether it is possible to arrange the target polyomino using the available polyominoes.

## Usage
Compile files with haskell compiler.
```
ghc main.hs
```

Run executable with input file.
```
./main [filepath]
```

Input file should be in the following format:
```
target polyomino
available polyomino 1
available polyomino 2
...
```

Polyomino is a list of coordinates as tuples.For example:
```
[(0, 0), (0, 1), (1, 0), (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3)]
[(0, 0), (0, 1), (1, 0)]
[(0, 1), (0, 2), (1, 2), (2, 1), (2, 2)]
[(0, 0), (0, 1), (1, 0), (1, 1)]
```

Expected output:
```
True
```

Another example:
```
[(0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (1, 0), (1, 1), (1, 2), (1, 3), (1, 4), (3, 0), (3, 1), (3, 2), (4, 0), (4, 1), (4, 2)]
[(0, 0), (0, 1), (0, 2), (0, 3)]
[(0, 0), (1, 0), (2, 0), (3, 0)]
[(0, 0), (0, 1), (1, 0), (1, 1)]
[(0, 0), (1, 0), (1, 1), (1, 2)]
[(0, 2), (1, 0), (1, 1), (1, 2)]
[(0, 0), (0, 1), (1, 1), (2, 1)]
[(0, 1), (0, 2), (1, 1), (2, 1)]
[(0, 0), (0, 1), (0, 2), (1, 0)]
[(0, 0), (0, 1), (0, 2), (1, 2)]
[(0, 1), (1, 0), (1, 1), (1, 2)]
[(1, 0), (1, 1), (1, 2), (2, 1)]
[(0, 1), (1, 1), (1, 2), (2, 1)]
[(0, 1), (1, 0), (1, 1), (2, 1)]
[(0, 1), (0, 2), (1, 0), (1, 1)]
[(0, 0), (0, 1), (1, 1), (1, 2)]
[(0, 1), (1, 1), (1, 2), (2, 2)]
[(0, 2), (1, 1), (1, 2), (2, 1)]
```

Expected output:
```
False
```