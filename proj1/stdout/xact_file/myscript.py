#Convert rtl transactions to tlm xact.txt file
import re

src=file('pythontest.out','r')

#target=file('sc_stub_in.txt','w')

print "# time command bytes address"
time=0

for line in src:
    #simdata=re.search(r"#\s+\d+\s(\S+)\saddr=(\S+)\ssize=(\S+)\sdata=\*+",line)
    simdata=re.search(r"#\s+\d+\s(\w+)\saddr=(\w+)(.+)",line)
    
    if simdata:
        cmd = simdata.group(1)
        addr= simdata.group(2)
        #size= simdata.group(3)
        #print "%s 0x%s"%(cmd,addr)
        #time=time+10
        print "  %s ns %s 0x4 0x%s"%(time,cmd,addr)    # 0 ns WRITE 0x4 0x10000200
    #else:
      #print " nothing"
      
     
        
        
src.close()
#target.close()
