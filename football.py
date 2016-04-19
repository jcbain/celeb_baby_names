import operator
import math
import pandas as pd
import csv
import matplotlib.pyplot as plt
from pylab import rcParams
import operator



football =  {
		'Name' : ['Aaron','Peyton','Adrian','Aaron','Tom','Peyton','Peyton','Tom','LaDainian','Shaun','Peyton','Peyton','Steve','Rich','Kurt','Terrell','Brett','Brett','Brett','Brett','Steve','Emmitt','Steve','Thurman','Joe','Joe','Boomer','John','Lawrence','Marcus','Dan','Joe','Mark','Ken','Brian','Earl'],
        'Year' : [2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000,1999,1998,1997,1996,1995,1994,1993,1992,1991,1990,1989,1988,1987,1986,1985,1984,1983,1982,1981,1980,1979]
        }
df = pd.DataFrame(football)
def popularity(selectname):
    #return the year in which name is most popular
    sumname={}
    f = open("/Users/Keevey/Documents/Explore/Baby_name/us-baby-names-release-2015-12-18-00-53-48/StateNames.csv")
    allStates = csv.reader(f)
    for line in allStates:
        state=line[4]
        gender=line[3]
        year=(line[2])
        name=line[1]
        count=(line[5])
        if name==selectname:
            sumname[year]=sumname.get(year,0)+int(count)
    for key,values in sorted(sumname.items(), key=operator.itemgetter(1),reverse=True): #sort by value:
        return key
    f.close()

        
Names = list(df.Name)
print(Names)
startYear=list(df.Year)
endYear=list(df.Year)
#Names = ['Woodrow','Calvin','Herbert','Franklin','Dwight','Kennedy','Lyndon','Jimmy']
#Names = ['Elvis','Hillary','John','Kennedy']
namesdict ={}
year_dict = {}
specificName={}
selectedNames =[]

for i in range(0,len(Names)):
    popyear = ''
    popyear = popularity(Names[i])
    if popyear is None:
        continue
    print("The Name " + str(Names[i]) +" is popular during the year " + str(popyear))
    influenceStart = int(startYear[i])-1
    influenceEnd = int(endYear[i])
                           
    if (int(popyear) >= influenceStart and int(popyear) <= influenceEnd): #If popularity is when the president is in office
        selectedNames.append(Names[i])

print("Names with highest popularity when the current MVP with same name is :") 
print(selectedNames)

f = open("/Users/Keevey/Documents/Explore/Baby_name/us-baby-names-release-2015-12-18-00-53-48/StateNames.csv")
allStates = csv.reader(f)

for line in allStates:
        state=line[4]
        gender=line[3]
        year=(line[2])
        name=line[1]
        count=(line[5])
        if name in selectedNames:
            specificName = namesdict.get(name,year_dict)
            specificName[year] = specificName.get(year,0)+int(count)
            namesdict[name] = specificName
f.close()

rcParams['figure.figsize'] = 17,24
#colors = list("rgbcmykr")
f, axarr = plt.subplots(2, sharex=True)

x=[]
y=[]
for key,values in sorted(year_dict.items(), key=operator.itemgetter(0)): #sort by year:
    x.append(key) #year

    y.append(values) #counts
axarr[0].plot(x, y,label=name,linewidth=2,color='b')
axarr[0].axvspan(2008,2009, alpha=0.5, color='red')
axarr[0].axvspan(2003,2004, alpha=0.5, color='red')
axarr[0].set_title('Peyton')
print(year_dict)

plt.show()

