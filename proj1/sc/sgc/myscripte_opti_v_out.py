#Convert rtl transactions to tlm xact.txt file
import re

src=file('testoutput.txt','r')

#target=file('sc_stub_in.txt','w')

print "# time command bytes address"
stamp=0

for line in src:
    #simdata=re.search(r"#\s+\d+\s(\S+)\saddr=(\S+)\ssize=(\S+)\sdata=\*+",line)
    simdata=re.search(r"(\d+)\sns(.+)",line)
    
    if simdata:
        nextstamp = simdata.group(1)
        rest= simdata.group(2)
        #size= simdata.group(3)
        #print "%s 0x%s"%(cmd,addr)
        #time=time+10
        diff=int(nextstamp)-stamp
        print "%s(+%s)%s"%(nextstamp,diff,rest)    # 0 ns WRITE 0x4 0x10000200
        stamp=int(nextstamp)
    #else:
      #print " nothing"
      
     
        
        
src.close()
#target.close()
