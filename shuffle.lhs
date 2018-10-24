
Seth Amundsen
10/20/2018

At attempt to randomize the contents of a list


> module Shuffle where


Captures the first half of a list

> top         :: [a] -> [a]
> top x        = take (quot (length x) 2) x


Captures the second half of a list

> bottom      :: [a] -> [a]
> bottom y     = reverse (take (quot (length y) 2) (reverse y))


Splits a list in half and swaps their order. Think cutting a deck of cards 

> cut         :: [a] -> [a]
> cut x        = bottom x ++ top x


Takes a list, splits it in half and generates a new list, taking the first
element from each half and adding it to the new list.

If d = [1..10], then shuffle d should produce [1, 10, 2, 9, 3, 8, ...]

 shuffle     :: [a] -> [a]

