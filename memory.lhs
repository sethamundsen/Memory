
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
cards are a match, the cards remain flipped over in the following turns and 
that player gets a point. If the selected cards are not a match, both cards
are flipped over again and the turn passes. Memory can have 1 or more players.

Cards are selected and flipped one at a time and a player may select their 
second card to flip after viewing the face of their first pick. 

Because each card belonds to a pair of the same cards, the board must have
an even number of spaces along each side of the board. For example, 2x2, 4x4, 
and 6x6

> module Memory where

> import Board

> type Mask = [[Bool]]


