module Data.CWG (CWG (EmptyCWG), add, nodes) where

data CWG a
    = Graph a (CWG a) (CWG a)
    | EmptyCWG

add :: Ord a => a -> CWG a -> CWG a
add n EmptyCWG = Graph n EmptyCWG EmptyCWG
add n' (Graph n l r) = Graph n newLeft newRight
  where
    newLeft
        | n' < n = add n' l
        | otherwise = l
    newRight
        | n' >= n = add n' r
        | otherwise = r

nodes :: Ord a => CWG a -> [a]
nodes EmptyCWG = []
nodes (Graph n l r) = nodes l ++ [n] ++ nodes r