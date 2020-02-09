module TestBasic where

import Test.Hspec

import Basic

testBasic :: SpecWith (Arg (IO ()))
testBasic = describe "Basic" $ do
    describe "myNull" $ do
        it "Should return True when the list is empty" $ do
            myNull [] `shouldBe` True

        it "Should return False when the list is not empty" $ do
            myNull [1] `shouldBe` False
            myNull [1..10] `shouldBe` False

    describe "myHead" $ do
        it "Should return the first element of the list" $ do
            myHead [1] `shouldBe` 1
            myHead [1..10] `shouldBe` 1

    describe "myTail" $ do
        it "Should return all the elements of the list except for the first" $ do
            myTail [1] `shouldBe` []
            myTail [1..5] `shouldBe` [2, 3, 4, 5]

    describe "myLast" $ do
        it "Should return the last element of the list" $ do
            myLast [1] `shouldBe` 1
            myLast [1..5] `shouldBe` 5

    describe "myInit" $ do
        it "Should return all the elements of the list except for the last" $ do
            myInit [1] `shouldBe` []
            myInit [1..5] `shouldBe` [1, 2, 3, 4]

    describe "myLength" $ do
        it "Should return the length of the list" $ do
            myLength [] `shouldBe` 0
            myLength [1] `shouldBe` 1
            myLength [1..5] `shouldBe` 5
