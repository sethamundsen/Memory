
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

> data Tile = BackFace  
>           | Square  
>           | Triangle
>             deriving(Show)


> isA :: Tile -> [String]
> isA BackFace = ["=====",
>                 "|===|",
>                 "|===|",
>                 "|===|",
>                 "====="]

> isA Square   = ["-----",
>                 "|   |",
>                 "|   |",
>                 "|   |",
>                 "-----"] 

> isA Triangle = ["_____",
>                 "|   /",
>                 "|  / ",
>                 "| /  ",
>                 "|/   "]



Now to print Tiles correctly

> showTile  :: Tile -> IO()
> showTile t = mapM_ putStrLn (isA t) 

And to prove that it works..!

> tile_test1 = showTile BackFace
> tile_test2 = showTile Square
> tile_test3 = showTile Triangle


Now that the tiles constructed, its time to make rows out of them

> type Row = [Tile]
> row1 = [BackFace, BackFace]

 showRow   :: [Tile] -> [[String]]
 showRow    = putStrLn .  mapM showTile






 type Grid          = [Row]


 Grid1              = [BackFace, BackFace, BackFace, BackFace]

 test1              = mapM showTile (Grid1)
 test2              = 
