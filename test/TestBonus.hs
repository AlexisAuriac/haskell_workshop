module TestBonus (
    testBonus
) where

import Data.Maybe

import Test.Hspec

import Bonus

predicToMaybe :: (a -> Bool) -> a -> Maybe ()
predicToMaybe p x
    | p x = Just ()
    | otherwise = Nothing

binopToMaybe :: (b -> a -> b) -> (b -> Bool) -> b -> a -> Maybe b
binopToMaybe f p x y
    | p res = Just res
    | otherwise = Nothing
    where res = f x y

testBonus :: SpecWith (Arg (IO ()))
testBonus = describe "Bonus" $ do
    describe "factorial" $ do
        it "Should return the factorial of the argument" $ do
            factorial 0 `shouldBe` 1
            factorial 1 `shouldBe` 1
            factorial 5 `shouldBe` 120
            factorial 10 `shouldBe` 3628800

    describe "listToListOfList" $ do
        it "Should a list where each element has its own list" $ do
            listToListOfList [1..5] `shouldBe` [[1],[2],[3],[4],[5]]
            listToListOfList "abcde" `shouldBe` ["a","b","c","d","e"]
            listToListOfList [] `shouldBe` ([] :: [[Int]])

    describe "checkAlltrue" $ do
        it "Should return true if all predicates are true for the value" $ do
            checkAlltrue 5 [odd, (<6)] `shouldBe` True
            checkAlltrue 10 [(>=0), (<20)] `shouldBe` True

        it "Should return false if any of the predicates are false for the value" $ do
            checkAlltrue 5 [odd, (<5)] `shouldBe` False
            checkAlltrue 10 [(== 0), (<20)] `shouldBe` False

        it "Should return true if the list of predicate is empty" $ do
            checkAlltrue 1 [] `shouldBe` True

    describe "myMapM" $ do
        it "Should return a positive output if all operations worked" $ do
            myMapM (predicToMaybe even) [0,2..10] `shouldSatisfy` isJust
            myMapM (predicToMaybe (>= 2)) [2..10] `shouldSatisfy` isJust

        it "Should return a negative output if any of the operations failed" $ do
            myMapM (predicToMaybe even) [1..10] `shouldSatisfy` isNothing
            myMapM (predicToMaybe (/= 5)) [1..10] `shouldSatisfy` isNothing

        it "Should return a positive result if the list is empty" $ do
            myMapM (predicToMaybe even) [] `shouldSatisfy` isJust

    describe "myFoldM" $ do
        it "Should return a positive output if all operations worked" $ do
            myFoldM (binopToMaybe (+) even) 0 [0,2..10] `shouldSatisfy` isJust
            myFoldM (binopToMaybe (flip (:)) ((<= 10) . length)) [] [1..10] `shouldSatisfy` isJust

        it "Should return a negative output if any of the operations failed" $ do
            myFoldM (binopToMaybe (+) even) 1 [0,2..10] `shouldSatisfy` isNothing
            myFoldM (binopToMaybe (+) even) 0 [0..10] `shouldSatisfy` isNothing
            myFoldM (binopToMaybe (flip (:)) ((< 10) . length)) [] [1..10] `shouldSatisfy` isNothing

        it "Should return a positive result if the list is empty" $ do
            myFoldM (binopToMaybe (+) even) 0 [] `shouldSatisfy` isJust
