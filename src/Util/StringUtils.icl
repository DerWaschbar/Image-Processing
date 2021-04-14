implementation module Util.StringUtils
import StdEnv

removeChar :: Char String -> String
removeChar c str = {x \\ x <-: str | x <> c}

splitBy :: Char String -> [String]
splitBy _ "" = []
splitBy c txt = [sx] ++ (splitBy c sxs)
where
    (sx, sxs) = takeFirstSplit c txt

takeFirstSplit :: Char String -> (String, String)
takeFirstSplit c str = ({x \\ x <- a}, rem )
where 
    ls = [x \\ x <-: str]
    (a, bb) = span ((<>)c) ls
    rem | length bb == 0 = "" = {x \\ x <- (drop 1 bb)}