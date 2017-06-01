
The game of Memory!
by Seth Amundsen
Functional Languages w/ Mark Jones
Spring 2017

In the game of Memory, tiles are layed out face down in a grid pattern. A turn
consists of a player choosing two cards on the board to flip over. If the two
cards are a match, the cards remain flipped over in the following turns and 
that player gets a point. If the selected cards are not a match, both cards
are flipped over again and the turn passes. Memory can have 1 or more players.

Cards are selected and flipped one at a time and a player may select their 
second card to flip after viewing the face of their first pick. 

Because each card belonds to a pair of the same cards, the board must have
an even number of spaces along each side of the board. For example, 2x2, 4x4, 
and 6x6

> import System.IO
> import Data.List
> import Data.Char

First I will define the tiles of the game

> data Tile          = BackFace  
>                    | Square  
>                    | Triangle
>                    | Diamond
>                    | Star
>                      deriving(Eq, Show)

> type Row           = [Tile]
> type Board         = [Row]
> type Coordinate    = (Int, Int)

> getFace           :: Tile -> [String]
> getFace BackFace   = ["=====",
>                       "|===|",
>                       "|===|",
>                       "|===|",
>                       "====="]

> getFace Square     = ["-----",
>                       "|   |",
>                       "|   |",
>                       "|   |",
>                       "-----"] 

> getFace Triangle   = ["_____",
>                       "|   /",
>                       "|  / ",
>                       "| /  ",
>                       "|/   "]

> getFace Diamond    = [" --- ", 
>                       "/   \\",
>                       "\\   /",
>                       " \\ / ",
>                       "  -  "]

> getFace Star       = ["  |  ",
>                       " \\|/ ",
>                       "--o--",
>                       " /|\\ ",
>                       "  |  "]

> board1 = [[Square, BackFace, Triangle, Square], [BackFace, Diamond, Diamond, Triangle]]

> matchTiles    :: Board -> Coordinate -> Coordinate -> Bool
> matchTiles board coord1 coord2 = t1 == t2
>                                  where t1 = getTile board coord1
>                                        t2 = getTile board coord2

> getTile                   :: Board -> Coordinate -> Tile
> getTile board (row, col)   = board !! col !! row




Now to print Tiles correctly

> showTile  :: Tile -> IO()
> showTile t = mapM_ putStrLn (getFace t) 

And to prove that it works..!

> tile_test1 = showTile BackFace
> tile_test2 = showTile Square
> tile_test3 = showTile Triangle


