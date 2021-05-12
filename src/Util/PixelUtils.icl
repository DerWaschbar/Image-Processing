implementation module Util.PixelUtils
import StdEnv
import PPM.Image


constrainPixel :: Int Int Pixel -> Pixel
constrainPixel low high px = {r = newR, g = newG, b = newB}
where
    newR | px.r < low = low | px.r > high = high = px.r
    newG | px.g < low = low | px.g > high = high = px.g
    newB | px.b < low = low | px.b > high = high = px.b

pixelSquareDistance :: Pixel Pixel -> Real
pixelSquareDistance px1 px2 = toReal (dr*dr + dg*dg + db*db)
where
    dr = px1.r - px2.r
    dg = px1.g - px2.g
    db = px1.b - px2.b

normalizedPixels :: Image -> [[Pixel]]
normalizedPixels img = pixels
where
    pixels = normalize img.width img.pixels

normalize :: !Int ![Pixel] -> ![[Pixel]]
normalize _ [] = []
normalize w pxs = [take w pxs] ++ (normalize w (drop w pxs)) 