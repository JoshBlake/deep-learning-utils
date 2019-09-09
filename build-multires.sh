#!/bin/bash

network='bbmsggan'
dataset='celeba10k'
experiment='001'
path='/data/jupyter/generative/BBMSG-GAN/sourcecode/samples'
outpath='/data/jupyter/videos'

declare -a res_dirs=('4_x_4' '8_x_8' '16_x_16' '32_x_32' '64_x_64' '128_x_128')

for res_dir in "${res_dirs[@]}"
do
	dir="${path}/${experiment}/${res_dir}/"
	/data/jupyter/util/rename-pad.py ${dir}*.png

	outfile="${outpath}/${network}-${dataset}-${experiment}-${res_dir//_}.mp4"
	echo "${dir} -> ${outfile}"
	./make-mp4.sh ${dir} ${outfile} gen_ 000001
done
