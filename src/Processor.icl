module Processor
import StdEnv
import PPM.Image
import PPM.IO
import Util.StringUtils


Start w = saveToPPM image (fname +++ "out.ppm") ww
where
    (image, ww) = loadFromPPM (fname +++ ".ppm") w
    fname = "test1"

// Start w = saveToPPM img (fname +++ ".ppm") w
// where
//     img = {width=10, height=10, maxVal=10, 
//             pixels=flatten [[{r=10, g=0, b=0} \\ x <- [0,1..10]] \\ y <- [0,1..10]]}
//     fname = "test1"