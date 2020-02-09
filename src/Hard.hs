module Hard (
    myReplicate,
    myIntersperse,
    myIntercalate,
    myZip,
    myUnzip,
    mySplitAt
) where

myReplicate :: Int -> a -> [a]
myReplicate n x = error "Not implemented"

myIntersperse :: a -> [a] -> [a]
myIntersperse _ [] = []
myIntersperse e xs = error "Not implemented"

myIntercalate :: [a] -> [[a]] -> [a]
myIntercalate e xs = error "Not implemented"

myZip :: [a] -> [b] -> [(a, b)]
myZip l1 l2 = error "Not implemented"

myUnzip :: [(a, b)] -> ([a], [b])
myUnzip xs = error "Not implemented"

mySplitAt :: Int -> [a] -> ([a], [a])
mySplitAt n xs = error "Not implemented"
