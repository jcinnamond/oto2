module SimpleSpec (spec) where

import Test.Hspec

spec :: Spec
spec = do
    it "runs the tests" $ do
        True `shouldBe` True