#Solution for p4
import re

src=file('sim.out','r')
busmasterbegin=dict()
busmasterend=dict()
busmaster=dict()

timestamp=0
totalbegintime=0
totalendtime=0
counter=dict()

for line in src:
    simtime=re.search(r"Info:\s\S+:\s(\d+)\s.+ ", line)
    if simtime:
        timestamp=simtime.group(1)
    begintrans=re.search(r"Initiator:\s(\d+)\sstarting new transaction",line)    
    endtrans=re.search(r"Initiator:\s(\d+)\stransaction waiting begin-response on backward path",line)    
    if begintrans:
        beginid=begintrans.group(1)
       # print "timestamp=%s"%timestamp
       # print "beginid=%s"%beginid
        haskey=0
	for key in busmasterbegin.keys():
            if (beginid==key):
                haskey=1
                break
        if haskey!=1:
            busmasterbegin[beginid]=0
            busmasterend[beginid]=0
            counter[beginid]=0
             
        busmasterbegin[beginid]=int(timestamp)+int(busmasterbegin[beginid])
    elif endtrans:
        endid=endtrans.group(1)
       # print "timestamp=%s"%timestamp
       # print "endid=%s"%endid
        busmasterend[endid]=int(timestamp)+int(busmasterend[endid])
        counter[endid]+=1

for k,v in busmasterbegin.items():
    busmaster[k]=(busmasterend[k]-v)/float(counter[k])
    print "Average duration of the address-phase for bus-master %s is "%k,busmaster[k]  
src.close()
