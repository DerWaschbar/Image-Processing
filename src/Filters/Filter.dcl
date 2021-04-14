definition module Filters.Filter
import StdEnv
import PPM.Image
import Filters.ColorFilters

applyColorFilter :: (Pixel -> Pixel) Image -> Image