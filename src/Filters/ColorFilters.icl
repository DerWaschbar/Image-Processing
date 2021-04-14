implementation module Filters.ColorFilters
import StdEnv
import PPM.Image

grayscaleFilter :: Pixel -> Pixel
grayscaleFilter px = px