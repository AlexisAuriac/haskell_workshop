module TestMedium1 where

import Test.Hspec

import Medium1

testMedium1 :: SpecWith (Arg (IO ()))
testMedium1 = describe "Medium1" $ do
    describe "myTake" $ do
        it "Should return the n first elements of a list" $ do
            myTake 4 [1..10] `shouldBe` [1..4]
            myTake 0 [1..10] `shouldBe` []
            myTake 1 [1..10] `shouldBe` [1]

        it "Should return the entire list if n is too big" $ do
            myTake 11 [1..10] `shouldBe` [1..10]
            myTake 100 [1..10] `shouldBe` [1..10]

    describe "myDrop" $ do
        it "Should return all but the n first elements of a list" $ do
            myDrop 4 [1..10] `shouldBe` [5..10]
            myDrop 0 [1..10] `shouldBe` [1..10]
            myDrop 10 [1..10] `shouldBe` []

        it "Should return an empty list if n is too big" $ do
            myDrop 11 [1..10] `shouldBe` []
            myDrop 100 [1..10] `shouldBe` []

    describe "mySpan" $ do
        it "Should seperate the longest prefix satisfying a predicate from the rest of the list" $ do
            mySpan even [2,6,4,5,7,6,3] `shouldBe` ([2,6,4], [5,7,6,3])
            mySpan odd [2,6,4,5,7,6,3] `shouldBe` ([], [2,6,4,5,7,6,3])
            mySpan (<5) [1..10] `shouldBe` ([1..4], [5..10])

    describe "myTakeWhile" $ do
        it "Should return the longest prefix (possibly empty) of elements that satisfy a predicate" $ do
            myTakeWhile (<5) [1..10] `shouldBe` [1..4]
            myTakeWhile even [0,2..10] `shouldBe` [0,2..10]
            myTakeWhile even [2,6,3,4,5,2,6] `shouldBe` [2, 6]

    describe "myDropWhile" $ do
        it "Should return the suffix remaining after takeWhile" $ do
            myDropWhile (>10) [1..10] `shouldBe` [1..10]
            myDropWhile (<5) [1..10] `shouldBe` [5..10]
            myDropWhile even [0,2..10] `shouldBe` []
            myDropWhile even [2,6,3,4,5,2,6] `shouldBe` [3,4,5,2,6]
