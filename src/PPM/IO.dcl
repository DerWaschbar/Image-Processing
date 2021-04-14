definition module PPM.IO
import StdEnv
import PPM.Image

saveToPPM :: !Image String *World -> *World

loadFromPPM :: !String *World -> (Image, *World)
