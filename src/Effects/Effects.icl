implementation module Effects.Effects
import StdEnv
import PPM.Image
import Filters.ColorFilters
import Util.PixelUtils

clearImage :: Image -> Image
clearImage img = {img & pixels=newPixels}
where
    newPixels = map (\x = {r=0,g=0,b=0}) img.pixels


cropImageHeight :: Int Int Image -> Image
cropImageHeight hl hr img = {img & height=nh, pixels=croppedPixels}
where
    nh = hr - hl
    partillyCropped = drop hl (normalizedPixels img)
    cropped = take nh partillyCropped
    croppedPixels = flatten cropped

cropImageWidth :: Int Int Image -> Image
cropImageWidth wl wr img = {img & width=nw, pixels=croppedPixels}
where
    nw = wr - wl
    norm = normalizedPixels img
    cropped = map (\ln = take nw (drop wl ln)) norm
    croppedPixels = flatten cropped

cropImage :: Int Int Int Int Image -> Image
cropImage wl hl wr hr img = croppedImage
where
    partiallyCropped = cropImageWidth wl wr img
    croppedImage = cropImageHeight hl hr partiallyCropped

enlargeImage :: Int Int Image -> Image
enlargeImage wmult hmult img = {img & width=img.width*wmult, height=img.height*hmult, pixels = npxs}
where
    pxs = normalizedPixels img
    widepxs = map (\ln = flatten (map (\x = [x \\ t<-[1..wmult]]) ln)) pxs
    largepxs = duplicateLines hmult widepxs 
    npxs = flatten largepxs

duplicateLines :: Int ![[a]] -> ![[a]]
duplicateLines _ [] = [] 
duplicateLines m [x:xs] = [x\\t<-[1..m]] ++ (duplicateLines m xs) 