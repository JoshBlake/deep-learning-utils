#!/bin/bash

if [ "$#" -lt 2 ]; then
    echo "Usage: ./make-mp4.sh <INPUT_PATH> <OUTPUT_MP4_FILENAME> [<PNG_PREFIX> [<PNG_SUFFIX>]]"
    exit 1
fi

inputpath="$1"
outputmp4="$2"
prefix="$3"
suffix="$4"

ffmpeg -y -framerate 30 -pattern_type glob -pix_fmt yuv420p -i "${inputpath}/${prefix}*${suffix}.png" $outputmp4
