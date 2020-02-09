import Test.Hspec

import TestBasic
import TestEasy
import TestMedium1
import TestMedium2
import TestHard

main :: IO ()
main = hspec $ do
    testBasic
    testEasy
    testMedium1
    testMedium2
    testHard
