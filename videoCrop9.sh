#! /bin/bash

echo "CROPPING VIDEO"
echo ""

echo "Input file (file.ext ) :"
read inputFile
echo ""

echo "Input width :"
read x
echo ""

echo "Input height :"
read y
echo ""

echo "Output file (file.ext ) :"
read outputFile
echo ""

echo "Output width :"
read ix
echo ""

echo "Output height :"
read iy
echo ""

echo "Crop margin from left :"
read cx
echo ""

echo "Crop margin from top :"
read cy
echo ""


clear
echo "CROPPING VIDEO"
echo ""
echo "Input file       : " $inputFile
echo "Input width      : " $x
echo "Input height     : " $y
echo "Output file      : " $outputFile
echo "Output width     : " $ix
echo "Output height    : " $iy
echo "Crop margin left : " $cx
echo "Crop margin top  : " $cy
echo ""
echo
echo "rightWidth       : " $(( $x - ( $cx + $ix ) ))
echo "rightMargin      : " $(( $cx + $ix ))
echo "bottomHeight     : " $(( $y - ( $cy + $iy ) ))
echo "bottomMargin     : " $(( $cy + $iy ))

read -p "Press any key to continue... "

# Top left
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$cx:$cy:0:0 -keyint_min 1 -b 500000 "00"$outputFile)
# Top middle
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$ix:$cy:$cx:0 -keyint_min 1 -b 500000 "01"$outputFile)
# Top right
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$(( $x - ( $cx + $ix ) )):$cy:$(( $cx + $ix )):0 -keyint_min 1 -b 500000 "02"$outputFile)

# Middle left
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$cx:$iy:0:$cy -keyint_min 1 -b 500000 "10"$outputFile)
# Middle middle
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$ix:$iy:$cx:$cy -keyint_min 1 -b 500000 "11"$outputFile)
# Middle right
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$(( $x - ( $cx + $ix ) )):$iy:$(( $cx + $ix )):$cy -keyint_min 1 -b 500000 "12"$outputFile)

# Bottom left
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$cx:$(( $y - ( $cy + $iy ) )):0:$(( $cy + $iy )) -keyint_min 1 -b 500000 "20"$outputFile)
# Bottom middle
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$ix:$(( $y - ( $cy + $iy ) )):$cx:$(( $cy + $iy )) -keyint_min 1 -b 500000 "21"$outputFile)
# Bottom right
echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$(( $x - ( $cx + $ix ) )):$(( $y - ( $cy + $iy ) )):$(( $cx + $ix )):$(( $cy + $iy )) -keyint_min 1 -b 500000 "22"$outputFile)



##### Better version with var i have to make functionnal...

# rightWidth = $(( $x - ( $cx + $ix ) ))
# rightMargin = $(( $cx + $ix ))
# bottomHeight = $(( $y - ( $cy + $iy ) ))
# bottomMargin = $(( $cy + $iy ))

## Top left
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$cx:$cy:0:0 -keyint_min 1 -b 500000 "00"$outputFile)
## Top middle
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$ix:$cy:$cx:0 -keyint_min 1 -b 500000 "01"$outputFile)
## Top right
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$rightWidth:$cy:$rightMargin:0 -keyint_min 1 -b 500000 "02"$outputFile)

## Middle left
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$cx:$iy:0:$cy -keyint_min 1 -b 500000 "10"$outputFile)
## Middle middle
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$ix:$iy:$cx:$cy -keyint_min 1 -b 500000 "11"$outputFile)
## Middle right
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$rightWidth:$iy:$rightMargin:$cy -keyint_min 1 -b 500000 "12"$outputFile)

## Bottom left
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$cx:$bottomHeight:0:$bottomMargin -keyint_min 1 -b 500000 "20"$outputFile)
## Bottom middle
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$ix:$bottomHeight:$cx:$bottomMargin -keyint_min 1 -b 500000 "21"$outputFile)
## Bottom right
# echo $(ffmpeg -i $inputFile -ar 22050 -r 25 -vf crop=$rightWidth:$bottomHeight:$rightMargin:$bottomMargin -keyint_min 1 -b 500000 "22"$outputFile)


read -p "Program ended. Press any key to quit. "

#
# EOF
