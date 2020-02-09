module TestHard where

import Test.Hspec

import Hard

testHard :: SpecWith (Arg (IO ()))
testHard = describe "Hard" $ do
    describe "myReplicate" $ do
        it "Should create a list of length n with x the value of every element" $ do
            myReplicate 0 1 `shouldBe` []
            myReplicate 10 1 `shouldBe` replicate 10 1
            myReplicate 10 'a' `shouldBe` replicate 10 'a'

    describe "myIntersperse" $ do
        it "Should take an element and a list and insert that element between each element of the list" $ do
            myIntersperse ',' "abcdef" `shouldBe` "a,b,c,d,e,f"
            myIntersperse 1 [2,4,6] `shouldBe` [2,1,4,1,6]
            myIntersperse 1 [] `shouldBe` []

    describe "myIntercalate" $ do
        it "Should insert a list xs in between the lists in xss and concatenates the result" $ do
            myIntercalate ", " ["Lorem", "ipsum", "dolor"] `shouldBe` "Lorem, ipsum, dolor"
            myIntercalate [1] [] `shouldBe` []

    describe "myZip" $ do
        it "Should take two lists and return a list of corresponding pairs" $ do
            myZip [1,2] ['a','b'] `shouldBe` [(1, 'a'), (2, 'b')]
            myZip [] [] `shouldBe` ([] :: [(Int, Int)])

        it "Should discard the excess elements of the longer list if the lists don't have the same length" $ do
            myZip [1] ['a','b'] `shouldBe` [(1, 'a')]
            myZip [1,2] ['a'] `shouldBe` [(1, 'a')]

    describe "myUnzip" $ do
        it "Should take a list of pairs and return a pair of lists" $ do
            myUnzip [(1, 'a'), (2, 'b')] `shouldBe` ([1,2], ['a','b'])
            myUnzip [] `shouldBe` ([] :: [Int], [] :: [Int])

    describe "mySplitAt" $ do
        it "Should split a list into two at a given index" $ do
            mySplitAt 6 "Hello World!" `shouldBe` ("Hello ","World!")
            mySplitAt 3 [1,2,3,4,5] `shouldBe` ([1,2,3],[4,5])
            mySplitAt 1 [1,2,3] `shouldBe` ([1],[2,3])
            mySplitAt 3 [1,2,3] `shouldBe` ([1,2,3],[])

        it "Should work with negative and too big numbers" $ do
            mySplitAt 4 [1,2,3] `shouldBe` ([1,2,3],[])
            mySplitAt 0 [1,2,3] `shouldBe` ([],[1,2,3])
            mySplitAt (-1) [1,2,3] `shouldBe` ([],[1,2,3])
