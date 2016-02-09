module Maximum where

import Prelude hiding (maximum)

maximum :: (Ord a) => [a] -> a
maximum []      = error "empty list"
maximum [x]     = x 
maximum (x:xs)  = max x (maximum xs)

-- maximum [1,2,3] 
-- -> max 1 (maximum [2,3])
-- -> max 1 (max 2 (maximum [3]))
-- 
