import Test.Hspec

import TestBasic
import TestEasy
import TestMedium1
import TestMedium2
import TestHard
import TestBonus

main :: IO ()
main = hspec $ do
    testBasic
    testEasy
    testMedium1
    testMedium2
    testHard
    testBonus
