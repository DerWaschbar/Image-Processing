implementation module PPM.IO
import StdEnv
import PPM.Image
import Util.StringUtils

// Write

writeImageToFile :: *File !Image -> *File
writeImageToFile file img
# file = file <<< img.type <<< "\n"
# file = file <<< img.width <<< ' ' <<< img.height <<< '\n'
# file = file <<< img.maxVal <<< '\n'
# file = foldl (\fl px = fl <<< px <<< ' ') file pixelList
= file
where 
    pixelList = imageToList img

saveToPPM :: !Image String *World -> *World
saveToPPM img fname w
# (ok, file, w) = fopen fname FWriteText w
| not ok = abort "Couldn't open file"
# file = writeImageToFile file img
# (fail, file) = ferror file
| fail = abort "Couldn't write to file"
# (ok, w) = fclose file w
= w


// Read

readFile :: *File -> ([String], *File)
readFile file
# (isEnd, file) = fend file
| isEnd = ([], file)
# (cur, file) = freadline file
# (res, file) = readFile file
= ([cur] ++ res, file)

lineToNums :: String -> [Int]
lineToNums line = map (toInt o (removeChar '\n')) (filter (\x = x <> "") (splitBy ' ' line))

numsToPixels :: [Int] -> [Pixel]
numsToPixels [] = []
numsToPixels lst = [px] ++ (numsToPixels (drop 3 lst))
where
    px = {r=lst!!0, g=lst!!1, b=lst!!2}

dataToImage :: [String] -> Image
dataToImage lines = img
where
    dataType = removeChar '\n' lines!!0
    dimensions = lineToNums (lines!!1)
    mxvl = hd (lineToNums (lines!!2))
    pixelsData = numsToPixels (flatten (map lineToNums (drop 3 lines)))
    img = {type = "P3", width=dimensions!!0, height=dimensions!!1, maxVal=mxvl,
            pixels = pixelsData
            // pixels=flatten [[{r=10, g=0, b=0} \\ x <- [0,1..10]] \\ y <- [0,1..10]]
            }


readImageFromFile :: *File -> (Image, *File)
readImageFromFile file 
# (lines, file) = readFile file
# image = dataToImage lines
// # (type, data) = (hd lines, drop 1 lines)
// | not (type == "P3\n") = abort "Invalid image format. Expected 'P3'"
= (image, file)

loadFromPPM :: !String *World -> (Image, *World)
loadFromPPM fname w
# (ok, file, w) = fopen fname FReadText w
| not ok = abort "Couldn't open file"
# (image, file) = readImageFromFile file
# (ok, w) = fclose file w
| not ok = abort "Couldn't close file"
= (image, w)


