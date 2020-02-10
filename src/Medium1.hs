module Medium1 (
    myTake,
    myDrop,
    mySpan,
    myTakeWhile,
    myDropWhile
) where

myTake :: Int -> [a] -> [a]
myTake n xs = error "Not implemented"

myDrop :: Int -> [a] -> [a]
myDrop n xs = error "Not implemented"

mySpan' :: (a -> Bool) -> [a] -> [a] -> ([a], [a])
mySpan' p xs left = error "Not implemented"

mySpan :: (a -> Bool) -> [a] -> ([a], [a])
mySpan p xs = error "Not implemented"

myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile p xs = error "Not implemented"

myDropWhile :: (a -> Bool) -> [a] -> [a]
myDropWhile p xs = error "Not implemented"
