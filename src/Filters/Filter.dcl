definition module Filters.Filter
import StdEnv
import PPM.Image
import Filters.ColorFilters

applyPixelFilter :: (Pixel -> Pixel) Image -> Image