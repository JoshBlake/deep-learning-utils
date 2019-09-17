#!/bin/bash

#if [ "$#" -lt 2 ]; then
#    echo "Usage: ./make-mp4.sh <INPUT_PATH> <OUTPUT_MP4_FILENAME> [<PNG_PREFIX> [<PNG_SUFFIX>]]"
#    exit 1
#fi

dataset='celeba1k'
network='bbmsggan'
path='/data/jupyter/generative/BBMSG-GAN/sourcecode/samples'

experiment='latent64-128-256-512'

outpath='/data/jupyter/videos'

res="64x64"
inputpath1="/data/jupyter/videos/bbmsggan-celeba1k-006-${res}.mp4"
inputpath2="/data/jupyter/videos/bbmsggan-celeba1k-007-${res}.mp4"
inputpath3="/data/jupyter/videos/bbmsggan-celeba1k-004-${res}.mp4"
inputpath4="/data/jupyter/videos/bbmsggan-celeba1k-005-${res}.mp4"
outputmp4="${outpath}/${network}-${dataset}-${experiment}-${res}.mp4"

label1="latent64"
label2="latent128"
label3="latent256"
label4="latent512"

cols='3'

col_filter="crop=iw/${cols}:ih:0:0,scale='max(720/${cols},iw)':-1,drawtext=fontfile=/usr/share/fonts/truetype/roboto/hinted/Roboto-Medium.ttf: start_number=1: x=(w-tw)/2: y=(lh)/2: fontcolor=white: fontsize=12: box=1: boxcolor=black: boxborderw=5: text=" 

filter_complex_params="[0:0]${col_filter}'${label1}'[a]; [1:0]${col_filter}'${label2}'[b]; [2:0]${col_filter}'${label3}'[c]; [3:0]${col_filter}'${label4}'[d]; [a][b][c][d]hstack=inputs=4,drawtext=fontfile=/usr/share/fonts/truetype/roboto/hinted/Roboto-Medium.ttf: text='Epoch\: %{frame_num}0': start_number=1: x=(w-tw)/2: y=(lh)/2: fontcolor=white: fontsize=16: box=1: boxcolor=black: boxborderw=5" 

ffmpeg -y -i "${inputpath1}" -i "${inputpath2}" -i "${inputpath3}" -i "${inputpath4}" -filter_complex "${filter_complex_params}" $outputmp4
