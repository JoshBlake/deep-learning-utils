#!/usr/bin/env python

import sys,os,re

padding = 6

for file in sys.argv[1:]:
	if __file__ in file: continue
	words = re.split('_|\.',file)
	for i in range(len(words)):
		if words[i].isnumeric():
			words[i] = words[i].zfill(padding)
	new_name = "_".join(words[:-1]) + "." + words[-1]
	print("{} -> {}".format(file, new_name))
	os.rename(file,new_name)
