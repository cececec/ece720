#Calcualte wire length for 720 hw06
import re
import math

src=file('FIR_cascade_routed.def','r')
target=file('hw06p3.m','w+')

total_length=0;
#print "Script Begin running"

tmp_length=0;
begin_cal=0;#False;
w=[];
num_chg=0;
flt=0.00;

target.write("w=[\n")
for line in src:
    
    if(begin_cal==0):
        wirebegin=re.search(r"\s+\+\sROUTED\s\w+\s\(\s(\S+)\s(\S+).+\)\s+\(\s+(\S+)\s+(\S+).+\)",line)
        if wirebegin:
            begin_cal=1;
            x=wirebegin.group(1)
            y=wirebegin.group(2)
            new_x=wirebegin.group(3)
            new_y=wirebegin.group(4)
            #target.write(" wire begin")
            #target.write("wire begin-->%s,%s %s,%s\n%s"%(x,y,z,v,line))
            if (new_x=="*"):
                tmp_length = abs(int(new_y)-int(y))    
            elif (new_y=="*"):
                tmp_length = abs(int(new_x)-int(x))
            #target.write("wire begin-->%s,%s %s,%s\n%s"%(x,y,new_x,new_y,tmp_length))
    else:
        simdata=re.search(r"\s+NEW\s\w+\s\(\s(\S+)\s(\S+).+\)\s+\(\s+(\S+)\s+(\S+).+\)",line) 
        end_cal=re.search(r"\s*\;",line)
        if simdata:
            num_chg+=1
            x    =simdata.group(1)
            y    =simdata.group(2)
            new_x=simdata.group(3)
            new_y=simdata.group(4)
            if (new_x=="*"):
                tmp_length += abs(int(new_y)-int(y))    
            elif (new_y=="*"):
                tmp_length += abs(int(new_x)-int(x))
            else: 
                print "ERROR"
            #target.write("%s"%line)
            #target.write("%s ->%s,%s,%s,%s\n"%(line,x,y,new_x,new_y))
        elif end_cal:
            #target.write("%s"%(line))
            flt=float(tmp_length)/float(2000)
            target.write("%s\n"%flt)
            begin_cal=0    
            w.append(tmp_length)
            total_length+=tmp_length
            tmp_length=0
            #target.write("wire end %s\n"%(num_chg))
            num_chg=0
    
    

target.write("]\n")
target.write("hist(w)\n")
target.write("mean(w)")

flt=float(total_length)/float(2000)
#print "============================%s==============================================="%flt
src.close()
#target.close()
