#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage: ./grid-mp4.sh <INPUT_PATH> <OUTPUT_MP4_FILENAME> [<PNG_PREFIX> [<PNG_SUFFIX>]]"
    exit 1
fi

inputpath="$1"
outputmp4="$2"
prefix="$3"
suffix="$4"

#framerate 750 = 30 * 5*5 tile, so we consume 25 frames for each frame and output 30 fps
fps="750"
tile="5x5"
padding="2"
ffmpeg -y -framerate ${fps} -pattern_type glob -pix_fmt yuv420p -i "${inputpath}/${prefix}*${suffix}" -vf "tile=${tile}:padding=${padding}:margin=${padding},scale='max(720,iw)':-1" $outputmp4
