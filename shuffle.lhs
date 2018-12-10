
Seth Amundsen
10/20/2018

At attempt to randomize the contents of a list


> module Shuffle where

> import Data.List
> import Data.Maybe
> import System.Random


  shuffle (length rndms) (top deck) (bottom deck) rndms

> shuffle                    :: (Eq a) =>  Int -> [a] -> [a] -> [Int] -> [a]
> shuffle n tp bttm shfl      | n <= 0 && (tp /= [] || bttm /= [])  = tp ++ bttm
>                             | n > 0  && (tp == [] && bttm == [])  = []
>                             | n > 0  && (tp == [] && bttm /= [])  = bttm
>                             | n > 0  && (tp /= [] && bttm == [])  = tp
>                             | n > 0  && (tp /= [] && bttm /= [])  = take (frst shfl) tp   ++
>                                                                     take (scnd shfl) bttm ++
>                                                                     shuffle (n - 2) (theRest (frst shfl) tp) (theRest (scnd shfl) bttm) (theRest 2 shfl)
>                             | otherwise                           = []

mkShuffled takes a list of randoms Int values, the size of the data set to be shuffled and an index into the list of random Ints
and returns a list of random numbers that add up to the total number of elements in the data set that need to be shuffled

if there are 10 elements in the list, mkShuffled might return a list that looks like this -> [1,2,2,1,1,2,2]

> mkShuffled              :: [Int] -> Int -> Int -> [Int]
> mkShuffled rndms max n   | sum (take n rndms) > max    = take n rndms
>                          | otherwise                   = mkShuffled rndms max (n + 1)  


top takes a list and returns the first half of it

> top                     :: [a] -> [a]
> top []                   = []
> top (x:[])               = [x]
> top x                    = take (quot (length x) 2) x


bottom takes a list and returns the bottom half of it. If the length of the list is odd, it returns the 
middle element plus the second half of the list

> bottom                  :: [a] -> [a]
> bottom []                = []
> bottom (y:[])            = [y]
> bottom y                 | odd (length y) == False    = reverse (take  (quot (length y) 2) (reverse y))
>                          | odd (length y) == True     = reverse (take ((quot (length y) 2) + 1) (reverse y))


frst returns the first value in a list of Ints or 0 if the list is empty

> frst                    :: [Int] -> Int
> frst []                  = 0
> frst (x:xs)              = frmJst (Just x)


scnd returns the second value in a list of Ints or 0  

> scnd                    :: [Int] -> Int
> scnd []                  = frmJst Nothing
> scnd (x:[])              = frmJst Nothing
> scnd (x:xs:_)            = frmJst (Just xs)


> theRest                :: Int -> [a] -> [a]
> theRest n []            = []
> theRest n (x:xs)        | n <  0                          = error "shuffle.theRest: negative values not allowed"
>                         | n == 0                          = (x:xs)
>                         | n >  0 && n >  length (x:xs)    = []
>                         | n >  0 && n <= length (x:xs)    = theRest (n - 1) xs 


> frmJst                  :: Maybe Int -> Int
> frmJst Nothing           = 0
> frmJst (Just x)          = x


> cut                     :: [a] -> [a]
> cut x                    = concat([bottom x,  top x])


mkShuffled generates a list of bounded random Ints such that the sum of the list is greater than the
total number of elements in a list of (a's)

This produces the simulation of a human hand shuffling a deck of cards 

To use mkShuffled, call it with: 'mkShuffled (randomRs (a,b) (mkStdGen 43)) (length deck) 0' where 
  (randomRs (1,3) (mkStdGen)) is a list of random numbers in the range of [a,b], 
  (length deck)               is the value that the sum of the first n numbers of the list of randoms needs to add up to
  0                           is the index of the first element in the list of randoms to begin taking from 



