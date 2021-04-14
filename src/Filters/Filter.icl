implementation module Filters.Filter
import StdEnv
import PPM.Image
import Filters.ColorFilters

applyColorFilter :: (Pixel -> Pixel) Image -> Image
applyColorFilter filter img = {img & pixels=newPixels}
where
    newPixels = map filter img.pixels