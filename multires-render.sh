#!/bin/bash

network='bbmsggan'
dataset='celeba10k'
experiment='008'
tag='L512'
path='/data/jupyter/generative/BBMSG-GAN/sourcecode/samples'
outpath='/data/jupyter/videos'

script_dir=`dirname "$0"`

#declare -a res_dirs=('4_x_4' '8_x_8' '16_x_16' '32_x_32' '64_x_64' '128_x_128')
declare -a res_dirs=('64_x_64' '32_x_32' '16_x_16' '8_x_8' '4_x_4')
#declare -a res_dirs=('4_x_4' '8_x_8' '16_x_16' '32_x_32')

for res_dir in "${res_dirs[@]}"
do
	dir="${path}/${experiment}/${res_dir}/"
	$script_dir/rename-pad.py ${dir}*.png

	# the weird ${res_dir//_} is a regex that replaces underscores with nothing (deletes them)
	outfile="${outpath}/${network}-${dataset}-${experiment}-${tag}-${res_dir//_}.mp4"
	echo "${dir} -> ${outfile}"
	$script_dir/make-mp4.sh ${dir} ${outfile} gen_ _000001.png
done
