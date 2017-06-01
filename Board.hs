
import Data.List(intersperse, transpose)

type Board = [Row]
type Row   = [Cell]
type Cell  = String

-- pad (or truncate) the given string to the specified length, adding
-- extra spaces at the front, if necessary:
padTo     :: Int -> String -> String
padTo w s  = reverse (take w (reverse s ++ repeat ' '))

showBoard :: Board -> String
showBoard b = unlines (intersperse hsep (map row b))
 where -- Find the size of the widest input:
       width = maximum (map length (concat b))
       -- Find the number of columns:  (assume all rows the same):
       cols  = length (head b)
       -- A horizontal separator between rows:
       hsep  = concat (intersperse "+" (replicate cols (replicate width '-')))
       -- Format a row, padding all columns to the specified width:
       row   = concat . intersperse "|" . map (padTo width)

test  :: Board -> IO ()
test b = putStr (showBoard b)

sample :: Board
sample  = [["12","1","300"],["a","b","c"],["0","72","X"]]

{-
Some sample runs:
Main> test sample
 12|  1|300
---+---+---
  a|  b|  c
---+---+---
  0| 72|  X

Main> test (sample++sample)
 12|  1|300
---+---+---
  a|  b|  c
---+---+---
  0| 72|  X
---+---+---
 12|  1|300
---+---+---
  a|  b|  c
---+---+---
  0| 72|  X

Main> test (transpose (sample++transpose sample))
 12|  a|  0| 12|  1|300
---+---+---+---+---+---
  1|  b| 72|  a|  b|  c
---+---+---+---+---+---
300|  c|  X|  0| 72|  X

Main>
-}
