module Data.CWGSpec (spec) where

import Data.CWG
import Test.Hspec

spec :: Spec
spec = do
    describe "adding a node" $ do
        describe "to an empty graph" $ do
            it "returns it as nodes" $ do
                nodes (add "Node" EmptyCWG) `shouldBe` ["Node"]
        describe "to an existing graph" $ do
            it "adds it to the existing nodes" $ do
                let g = add "Node 2" $ add "Node 1" EmptyCWG
                nodes g `shouldBe` ["Node 1", "Node 2"]
            it "sorts the nodes" $ do
                let g = foldr add EmptyCWG ["Node 2", "Node 1", "Node 3"]
                nodes g `shouldBe` ["Node 1", "Node 2", "Node 3"]