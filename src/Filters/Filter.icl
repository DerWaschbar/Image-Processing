implementation module Filters.Filter
import StdEnv
import PPM.Image
import Filters.ColorFilters

applyPixelFilter :: (Pixel -> Pixel) Image -> Image
applyPixelFilter filter img = {img & pixels=newPixels}
where
    newPixels = map filter img.pixels