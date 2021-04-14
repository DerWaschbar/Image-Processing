implementation module Filters.ColorFilters
import StdEnv
import PPM.Image

grayscaleFilter :: Pixel -> Pixel
grayscaleFilter px = {r = newR, g = newG, b = newB}
where
    gray = px.r / 3 + px.g / 3 + px.b / 3
    newR = gray
    newG = gray
    newB = gray


    