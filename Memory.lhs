
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

> import Data.Char(isDigit, digitToInt)
> import Board


To track  the progress of the game and to determine when the game has been won
the game will keep track of a list of lists of Bools. Each Bool will map to a
specific Tile in the Solution Board. When a Bool in the Mask is True, the Tile
in the Solution Board that corresponds to the Bool will be visible. When that
Bool is False, the Tile that it Maps to will not be visible to the player.


> newline               :: IO()
> newline                = putChar '\n'

 getCoordinates        :: IO (Int, Int)
 getCoordinates         = do row <- getLine
                             col <- getLine
                             if isDigit row && isDigit col then return (digitToInt row, digitToInt col)
                                                           else do putStrLn "Error: Invalid coordinate for Tile selection"
                                                                   getCoordinates
                           
                               

 toCoord               :: Int -> Int -> Coordinate
 toCoord row col        = (row, col)

> play                  :: IO()
> play                   = do newline
>                             putStrLn "Welcone to the great game of Memory!"
>                             newline
>                             putStrLn "How to play:"
>                             putStrLn "A turn consists of selecting two Tiles, one at a time. If the selected Tiles are a match"
>                             putStrLn "the turn passes with those Tiles remaining face up in the following turns. If the selected"
>                             putStrLn "cards are not a match, the flip back over and you get to try again!"
>                             newline
>                             putStrLn "Cards are selected by their row/column coordinates. So, lets gets started!"
>                             play solution mask



 play'                 :: Board -> Mask -> IO()
 play' solution mask    = do newline
                             putStrLn( unlines( showBoard( hide solution mask)))
                             newline
                             newline
                             putStr "Select a card (row/col): "
                             coord1 <- getCoordinates
                             newline
                             putStrLn( unlines( showBoard( hide solution( toggle coord1 mask))))
                             putStr "Select another card (row/col): "
                             coord2 <- getCoordinates
                             newline
                             putStrLn( unlines( showBoard (hide solution( toggle coord1 (toggle coord1 mask)))))

                             if play' solution mask
 
