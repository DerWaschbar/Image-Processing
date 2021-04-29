definition module Filters.ColorFilters
import StdEnv
import PPM.Image

grayscaleFilter :: Pixel -> Pixel

wGrayscaleFilter :: Pixel -> Pixel

thresholdGrayscaleFilter :: Int Real Pixel -> Pixel

selectiveGrayscaleFilter :: Pixel Real Pixel -> Pixel

tintFilter :: Real Real Real Pixel -> Pixel

brightnessFilter :: Int Real Pixel -> Pixel
