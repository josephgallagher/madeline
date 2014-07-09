#!/usr/bin/python
import sys
import os

data = sys.argv[1]



def read_file():
	pl = open("parts file", "w")
	for word in file(data).read().split():
		if '-ND' in word:
			pl.write(word + "\n")






def parts():
	pl = open("parts file", "r")
	for line in pl:
		cmd = "bash search.sh " + line
		os.system(cmd)





#Function Calls
read_file()
parts()
