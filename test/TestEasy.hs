module TestEasy where

import Test.Hspec

import Easy

testEasy :: SpecWith (Arg (IO ()))
testEasy = describe "Easy" $ do
    describe "myElem" $ do
        it "Should return True if the element is in the list" $ do
            myElem 4 [1..10] `shouldBe` True
            myElem 'a' "abc" `shouldBe` True
            myElem 'c' "abc" `shouldBe` True

        it "Should return False if the element is not in the list" $ do
            myElem 0 [1..10] `shouldBe` False
            myElem 'd' "abc" `shouldBe` False

    describe "myNotElem" $ do
        it "Should return True if the element is not in the list" $ do
            myNotElem 0 [1..10] `shouldBe` True
            myNotElem 'd' "abc" `shouldBe` True

        it "Should return False if the element is in the list" $ do
            myNotElem 4 [1..10] `shouldBe` False
            myNotElem 'a' "abc" `shouldBe` False
            myNotElem 'c' "abc" `shouldBe` False

    describe "myConcat" $ do
        it "Should concatenate a list of lists" $ do
            myConcat [[1..10], [11..20]] `shouldBe` [1..20]
            myConcat [] `shouldBe` ([] :: [[Int]])
            myConcat [[1,3..10], [4]] `shouldBe` [1,3,5,7,9,4]

    describe "myReverse" $ do
        it "Should reverse the order of the elements in the list" $ do
            myReverse [1..10] `shouldBe` [10,9..1]
            myReverse [] `shouldBe` ([] :: [Int])

    describe "myNub" $ do
        it "Should remove duplicates from the list, keeps the first occurence" $ do
            myNub [] `shouldBe` ([] :: [Int])
            myNub [1..10] `shouldBe` [1..10]
            myNub "asdfasdf" `shouldBe` "asdf"
            myNub [1,2,3,4,3,2,1,2,4,3,5] `shouldBe` [1,2,3,4,5]

    describe "myFind" $ do
        it "Should find and return the first element in a list satisfying a predicate" $ do
            myFind (>4) [1..10] `shouldBe` 5
            myFind even [1,5,6,3,5,2,3,4] `shouldBe` 6
