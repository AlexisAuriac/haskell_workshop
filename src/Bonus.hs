module Bonus (
    factorial,
    listToListOfList,
    checkAlltrue,
    myMapM,
    myFoldM
) where

-- Use only 1 foldl call
factorial :: Int -> Int
factorial n = error "Not implemented"

-- Use only 1 map call
listToListOfList :: [a] -> [[a]]
listToListOfList xs = error "Not implemented"

-- Use only 1 all call
checkAlltrue :: a -> [a -> Bool] -> Bool
checkAlltrue x ps = error "Not implemented"

myMapM :: (Monad m) => (a -> m b) -> [a] -> m [b]
myMapM f xs = error "Not implemented"

myFoldM :: (Monad m) => (b -> a -> m b) -> b -> [a] -> m b
myFoldM f res xs = error "Not implemented"
