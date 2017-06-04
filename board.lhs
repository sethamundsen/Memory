
> module Board where

board.lhs is a collection of board utility functions
and associated data types that will be used to play
the game of... 

A board is made up of a set of Tiles organized in a 
grid. Tiles represent a two sided card. One side is
the same on all the Tiles and the other side is a
picture.  All Tiles on the grid have an associated
matching Tile. 


> import Data.List


In Memory, a game is played on a board and a board is
thought of as a list of Rows. A Row is thought of as 
as list of Tiles and the Tiles are unique lists of
Strings.

> data Tile         = BackFace
>                   | Square
>                   | Triangle
>                   | Diamond
>                   | Star

> type Row          = [Tile]
> type Board        = [Row]


Lets build some Tiles!

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


Now that we have Tiles to play with, we need to gather
them into Rows.

> showRow       :: Row -> [String]
> showRow r      = format( map (concat . intersperse " | ") (transpose (map showTile r)))


And now to gather the Rows into a Board. 

> showBoard     :: Board -> [String]
> showBoard b    = concat (intersperse[tb, mb, tb] (map showRow b))
>                  where tb              = hbar " | " ' '
>                        mb              = hbar "-+-" '-'
>                        hbar csep sp    = concat (intersperse csep (replicate n (replicate 7 sp)))
>                        n               = length (head b) 

The format function just adds some padding to the front
of each of the Rows. this is to allow the bars that 
separate each of the Rows to extend beyond the Tile just
a little bit.

> format        :: [String] -> [String]
> format b       = map ("  " ++) b



