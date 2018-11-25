#!/usr/bin/env python

import random
import sys
import os
import datetime

start_time = datetime.datetime.now()

path= sys.argv[1]
extension= sys.argv[2]

files= os.listdir(path)
size= len(files)
max_limit= len(str(size))
print max_limit


random.shuffle(files)

i= 0
while i < size:
    os.rename(path + "/"+ files[i], path + "/" + "0"*(max_limit-(len(str(i)))) + str(i) + extension)
    i += 1

print "elapsed time: ", (datetime.datetime.now() - start_time).seconds, "s"



