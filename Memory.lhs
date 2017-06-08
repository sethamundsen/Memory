
The game of Memory!
by Seth Amundsen
Functional Languages w/ Mark Jones
Spring 2017


Welcome to the great game of...


 mm mm    eeee    mm mm    oooo          y  y
m  m  m  ee  ee  m  m  m  oo  oo  r rr  y  yy
m  m  m  e  ee   m  m  m  o    o  rr     yy y
m  m  m  ee      m  m  m  oo  oo  r         y
m  m  m   eee    m  m  m   oooo   r      yyy


In the game of Memory, tiles are layed out face down in a grid pattern. A turn
consists of a player choosing two cards on the board to flip over. If the two
cards are a match, the cards remain flipped over in the following turns. If the 
selected cards are not a match, both cards are flipped over again and the turn 
passes. Memory can have 1 or more players.

Cards are selected and flipped one at a time and a player may select their 
second card to flip after viewing the face of their first pick. 

Because each card belongs to a pair of the same cards, the board must have
an even number of spaces.

> module Memory where

> import Data.Char
> import Board


To track  the progress of the game and to determine when the game has been won
the game will keep track of a list of lists of Bools. Each Bool will map to a
specific Tile in the Solution Board. When a Bool in the Mask is True, the Tile
in the Solution Board that corresponds to the Bool will be visible. When that
Bool is False, the Tile that it Maps to will not be visible to the player.

> cls                   :: IO()
> cls                    = putStr "\ESC[2J"

> newline               :: IO()
> newline                = putChar '\n'

> getInt                :: String -> IO Int
> getInt prompt          = do putStr prompt
>                             s <- getLine
>                             if not(null s) && all isDigit s then return (read s)
>                                                             else getInt "Invalid input: "
        
> getCoord              :: IO Coordinate
> getCoord               = do r <- getInt "Enter row: "
>                             c <- getInt "Enter col: "
>                             return (r, c)


> getTile               :: Coordinate -> Tile
> getTile (row, col)     = return ((solution !! row) !! col)


> play                  :: IO()
> play                   = do cls
>                             mapM_ putStrLn ["Wecome to the great game of Memory!! To play, select cards to flip based on their row/col", 
>                                             "coordinates.  If the two selections are a match, they will stay flipped. If they are not", 
>                                             "a match, the cards will flip back over and the turn passes.",
>                                             "NOTE: The first row is the 0th row and the first col is the 0th col"]
>                             play' solution mask


> play'                 :: Board -> Mask -> IO()
> play' solution mask    = do cls
>                             putStr( unlines( showBoard( hide solution mask)))
>                             c1 <- getCoord
>                             cls
>                             t1 <- getTile c1

>                             putStr( unlines( showBoard( hide solution (toggle c1 mask))))
>                             c2 <- getCoord
>                             cls
>                             putStrLn( unlines( showBoard (hide solution( toggle c2 (toggle c1 mask)))))
>                             if c1 == c2 then do putStr "Match!"
>                                                 play' solution (toggle c2( toggle c1 mask))
>                                         else do putStr "Not a match!"
>                                                 play' solution mask
