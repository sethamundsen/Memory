
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
>                     deriving (Eq, Show)

> type Row          = [Tile]
> type Board        = [Row]
> type Mask         = [[Bool]]
> type Coordinate   = (Int, Int)

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
> showRow r      = map (concat . intersperse " | ") (transpose (map showTile r))


And now to gather the Rows into a Board. 

> showBoard     :: Board -> [String]
> showBoard b    = concat (intersperse[tb, mb, tb] (map showRow b))
>                  where tb              = hbar " | " ' '
>                        mb              = hbar "-+-" '-'
>                        hbar csep sp    = concat (intersperse csep (replicate n (replicate 5 sp)))
>                        n               = length (head b) 

> goto x y               = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")


> cls                   :: IO()
> cls                    = putStr "\ESC[2J"

> solution               = [[Square, Star, Triangle, Diamond], 
>                           [Diamond, Square, Star, Triangle],
>                           [Square, Diamond, Triangle, Star], 
>                           [Star, Diamond, Triangle, Square]]

> solution1              = [[Triangle, Square],
>                           [Square, Triangle]]

> mask                   = initialMask solution
> mask1                  = initialMask solution1


> initialMask           :: Board -> Mask
> initialMask            = map( map( \f -> False))

> hide                  :: Board -> Mask -> Board
> hide                   = zipWith( zipWith(\t b -> if b then t else BackFace))

> upd                   :: Int -> (a -> a) -> [a] -> [a]
> upd i f xs             = as ++ [f x] ++ bs
>                          where (as, x:bs) = splitAt i xs

> toggle                :: Coordinate -> Mask -> Mask
> toggle (row, col)      = upd row (upd col not)

> isMatch               :: Tile -> Tile -> Bool
> isMatch t1 t2          = if t1 == t2 then True else False




