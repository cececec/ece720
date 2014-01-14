import re, os

subdirs=os.listdir('./')
hassubdir=0

for line in subdirs:
    m=re.search(r"^subdir$",line)
    if m:
        hassubdir=1
        break

if not hassubdir:
    os.mkdir('subdir')
