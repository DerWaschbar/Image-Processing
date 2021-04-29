implementation module Filters.ColorFilters
import StdEnv
import PPM.Image
import Util.PixelUtils

grayscaleFilter :: Pixel -> Pixel
grayscaleFilter px = {r = newR, g = newG, b = newB}
where
    gray = px.r / 3 + px.g / 3 + px.b / 3
    newR = gray
    newG = gray
    newB = gray


wGrayscaleFilter :: Pixel -> Pixel
wGrayscaleFilter px = {r = newR, g = newG, b = newB}
where
    gray = toInt (0.3 * (toReal px.r) + 0.59 * (toReal px.g) + 0.11 * (toReal px.b))
    newR = gray
    newG = gray
    newB = gray

thresholdGrayscaleFilter :: Int Real Pixel -> Pixel
thresholdGrayscaleFilter maxVal threshold px = res
where
    gray = toInt (0.3 * (toReal px.r) + 0.59 * (toReal px.g) + 0.11 * (toReal px.b))
    res | gray > toInt((toReal maxVal) * threshold) = {r=255,g=255,b=255} = {r=0,g=0,b=0}

selectiveGrayscaleFilter :: Pixel Real Pixel -> Pixel
selectiveGrayscaleFilter selpx dis px 
        | pixelSquareDistance selpx px <= dis*dis = px = {r = newR, g = newG, b = newB}
where
    gray = toInt (0.3 * (toReal px.r) + 0.59 * (toReal px.g) + 0.11 * (toReal px.b))
    newR = gray
    newG = gray
    newB = gray


tintFilter :: Real Real Real Pixel -> Pixel
tintFilter rt gt bt px = {r = newR, g = newG, b = newB}
where
    newR = toInt (rt * (toReal px.r))
    newG = toInt (gt * (toReal px.g))
    newB = toInt (bt * (toReal px.b))

brightnessFilter :: Int Real Pixel -> Pixel
brightnessFilter maxVal deltaPercentage px = constrainPixel 0 maxVal {r = newR, g = newG, b = newB}
where
    newR = px.r + (toInt ((toReal maxVal) * deltaPercentage))
    newG = px.g + (toInt ((toReal maxVal) * deltaPercentage))
    newB = px.b + (toInt ((toReal maxVal) * deltaPercentage))