-- Solution by Maxcell Prince Wilson

module Evens where


-- Recursively
evenIndexes :: [Int] -> [Int]
evenIndexes [] = []
evenIndexes [x] = [x]
evenIndexes (e1:e2:xs) = e1 : evenIndexes xs

-- Cooler and simpler
evenIndexes' :: [Int] -> [Int]
evenIndexes' arr = [ snd x  | x <- zip [0..] arr, ((fst x) `mod` 2 == 0) ]

--Another solution
evenIndexes::[Int]->[Int]
evenIndexes [] = []
evenIndexes xs = [xs !! x|x<-[0,2..z]]
            where z = length xs
