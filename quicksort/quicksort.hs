quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallOrEqual = filter (<=x) xs
        larger = filter (>x) xs
    in  quicksort smallOrEqual ++ [x] ++ quicksort larger
