
board.lhs is a collection of board utility functions
and associated data types that will be used to play
the game of... 
 
 mm mm    eeee    mm mm    oooo          y  y
m  m  m  ee  ee  m  m  m  oo  oo  r rr  y  yy
m  m  m  e  ee   m  m  m  o    o  rr     yy y
m  m  m  ee      m  m  m  oo  oo  r         y
m  m  m   eee    m  m  m   oooo   r      yyy


A board is made up of a set of Tiles organized in a 
grid. Tiles represent a two sided card. One side is
the same on all the Tiles and the other side is a
picture.  All Tiles on the grid have an associated
matching Tile. 


> import Data.List


> data Tile         = BackFace
>                   | Square
>                   | Triangle
>                   | Diamond
>                   | Star

> type Row          = [Tile]
> type Board        = [Row]


> showTile         :: Tile -> [String]
> showTile BackFace = ["=====",
>                      "|===|",
>                      "|===|",
>                      "|===|",
>                      "====="] 

> showTile Square   = ["-----",
>                      "|   |",
>                      "|   |",
>                      "|   |",
>                      "-----"] 

> showTile Triangle = ["_____",
>                      "|   /",
>                      "|  / ",
>                      "| /  ",
>                      "|/   "]

> showTile Diamond  = [" --- ", 
>                      "/   \\",
>                      "\\   /",
>                      " \\ / ",
>                      "  -  "]

> showTile Star     = ["  |  ",
>                      " \\|/ ",
>                      "--o--",
>                      " /|\\ ",
>                      "  |  "]


> showRow       :: Row -> [String]
> showRow r      = map (concat . intersperse " | ") (transpose (concat ' ' (map showTile r)))

 showBoard     :: Board -> [String]
 showBoard b    = concat (intersperse[tb, mb, tb] (map showRow b))
                  where tb             = concat( intersperse " | " (replicate n (replicate 6 ' ')))
                        mb             = concat( intersperse "-+-" (replicate n (replicate 6 '-')))
                        n              = length(head b)

Constructed with Mark Jones during office hours

> showBoard     :: Board -> [String]
> showBoard b    = concat (intersperse[tb, mb, tb] (map showRow b))
>                  where tb              = hbar " | " ' '
>                        mb              = hbar "-+-" '-'
>                        hbar csep sp    = concat (intersperse csep (replicate n (replicate 6 sp)))
>                        n               = length (head b)

End  

> solution_board = [[Square, Star, Triangle, Triangle],[Diamond, Square, Diamond, Star]]

