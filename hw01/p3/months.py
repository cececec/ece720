

class month:
    def __init__(self, name, index, numdays):
        self.name = name
        self.index = index
        self.numdays = numdays

    def __str__(self):
        return '%2d %9s %2d'%(self.index,self.name,self.numdays)



class monthlist:
    def __init__(self):
        self.dict = {}

    def add(self, name, numdays):
        self.dict[name]=month(name,len(self.dict)+1,numdays)

    def listall(self):
        for m in self.dict:
            print self.dict[m]