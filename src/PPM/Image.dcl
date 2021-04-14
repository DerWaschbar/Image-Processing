definition module PPM.Image
import StdEnv

:: Pixel = {r :: !Int
           ,g :: !Int
           ,b :: !Int
           }

:: Image = {type :: String
           ,width :: !Int
           ,height :: !Int
           ,maxVal :: !Int 
           ,pixels :: [Pixel]
           }

imageToList :: !Image -> [Int]