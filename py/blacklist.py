import os  
blacklist = ["X1", "X2"]
tFileList="myStrings.txt"
with open(r"%s"%(tFileList)) as f, open(r"workfile.txt", "w") as working:
    for line in f:
        write = True
        for string in blacklist:
           if string.lower() in line.lower():
               write = False
               break
        if write:
               working.write(line) 
os.remove(r"%s"%(tFileList))
os.rename(r"workfile.txt", r"%s"%(tFileList))
