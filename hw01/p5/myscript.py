# Calculating the depth of a tree model
import re

src=file('tree.txt','r')
depth_counter=0
flag=0

for line in src:
    vertex=re.search("(\w):.*",line)
    if vertex and not flag:
        bottom_vertex=vertex.group(1)
        flag=1
    sub_vertex=re.search("\w:[\s(\w?)]*",line)
    if sub_vertex:
        for item in sub_vertex.group():
            if item==bottom_vertex:
               # print bottom_vertex
                bottom_vertex=vertex.group(1)
                depth_counter+=1
print depth_counter
src.close()


