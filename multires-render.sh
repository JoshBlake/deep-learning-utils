#!/bin/bash

network='bbmsggan'
dataset='celeba1k'
experiment='003'
path='/data/jupyter/generative/BBMSG-GAN/sourcecode/samples'
outpath='/data/jupyter/videos'

script_dir=`dirname "$0"`

#declare -a res_dirs=('4_x_4' '8_x_8' '16_x_16' '32_x_32' '64_x_64' '128_x_128')
declare -a res_dirs=('4_x_4' '8_x_8' '16_x_16' '32_x_32' '64_x_64')
#declare -a res_dirs=('4_x_4' '8_x_8' '16_x_16' '32_x_32')

for res_dir in "${res_dirs[@]}"
do
	dir="${path}/${experiment}/${res_dir}/"
	$script_dir/rename-pad.py ${dir}*.png

	outfile="${outpath}/${network}-${dataset}-${experiment}-${res_dir//_}.mp4"
	echo "${dir} -> ${outfile}"
	$script_dir/make-mp4.sh ${dir} ${outfile} gen_ 000001
done
