import re, sys

filename=sys.argv[1]



class addr_log:
  def __init__(self,start,end):
    self.start_addr=start
    self.end_addr=end
    self.read_count=0
    self.write_count=0
    self.max_addr=start;
    self.min_addr=end;

  def print_stat(self):
    print "STATISTICS for addr range 0x"+"%x"%(self.start_addr), \
          "to 0x"+"%x"%(self.end_addr)
    print "Number of Reads:          ",self.read_count
    print "Number of Writes:         ",self.write_count
    if (self.min_addr==self.end_addr):
      print "Minimum address accessed:  n/a"
    else:
      print "Minimum address accessed:  0x"+"%x"%(self.min_addr)
    if (self.max_addr==self.start_addr):
      print "Maximum address accessed:  n/a"
    else:
      print "Maximum address accessed:  0x"+"%x"%(self.max_addr)

  def log(self,addr,write):
    if ( (addr >= self.start_addr) and (addr < self.end_addr) ):
      if write:
        self.write_count=self.write_count+1
      else:
        self.read_count=self.read_count+1
      if (addr > self.max_addr):
        self.max_addr=addr
      if (addr < self.min_addr):
        self.min_addr=addr

logs=[ addr_log(int('0',16),int('0000FFFF',16)),
       addr_log(int('00010000',16),int('1FFFFFFF',16)),
       addr_log(int('20000000',16),int('FFFFFFFF',16)),
     ]

f=file(filename)

for line in f:
  m=re.search(r"(READ|WRITE) addr=([0-9a-f]+) size=(\w+) data=([0-9a-f]+)",line)
  if m:
    cmd=m.group(1)
    addr=m.group(2)
    size=m.group(3)
    data=m.group(4)
    #print cmd,addr,size,data
    for log in logs:
      log.log(int(addr,16),cmd=='WRITE')


f.close()

for log in logs:
  log.print_stat()
