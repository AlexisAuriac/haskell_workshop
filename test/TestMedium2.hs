module TestMedium2 where

import Test.Hspec

import Medium2

testMedium2 :: SpecWith (Arg (IO ()))
testMedium2 = describe "Medium2" $ do
    describe "myMap" $ do
        it "Should compute a new list by applying a function to each element of a list" $ do
            myMap (+3) [1..10] `shouldBe` [4..13]
            myMap even [1..4] `shouldBe` [False, True, False, True]
            myMap (:[]) [1..4] `shouldBe` [[1], [2], [3], [4]]

    describe "myFoldl" $ do
        it "Should reduce a list to 1 value by applying a function to an accumulator and each element of the list" $ do
            myFoldl (+) 0 [1..10] `shouldBe` sum [1..10]
            myFoldl (*) 1 [1..5] `shouldBe` 120
            myFoldl (&&) True [True, True, True] `shouldBe` True
            myFoldl (&&) False [True, True, True] `shouldBe` False
            myFoldl (&&) True [] `shouldBe` True
            myFoldl (&&) True [True, False] `shouldBe` False

    describe "myPartition" $ do
        it "Should seperate the elements of the list into those that satisfy a predicate and those who don't" $ do
            myPartition id [True, False, True] `shouldBe` ([True, True], [False])
            myPartition id [] `shouldBe` ([], [])
            myPartition (>5) [1,5,8,8,2,5,2,4,9] `shouldBe` ([8,8,9], [1,5,2,5,2,4])
            myPartition (`elem` "aeiou") "Hello World!" `shouldBe` ("eoo","Hll Wrld!")

    describe "myFilter" $ do
        it "Should return the list of those elements that satisfy the predicate" $ do
            myFilter id [True, False, True] `shouldBe` [True, True]
            myFilter id [] `shouldBe` []
            myFilter (>5) [1,5,8,8,2,5,2,4,9] `shouldBe` [8,8,9]
            myFilter (`elem` "aeiou") "Hello World!" `shouldBe` "eoo"
