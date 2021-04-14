implementation module PPM.Image
import StdEnv

imageToList :: !Image -> [Int]
imageToList img = flatten (map rgbToList img.pixels)
where
    rgbToList p = [p.r, p.g, p.b]