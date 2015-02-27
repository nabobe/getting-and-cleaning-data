fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile="data_week4.csv")
data<-read.csv("data_week4.csv")
head(data)
strsplit(data) 
?strsplit
names<-names(data)
splitNames=strsplit(names,"wgtp")
splitNames[[123]]
splitNames[123]

#question 2
Url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" 
download.file(Url2,destfile="data_week4_2.csv")
data2<-read.csv("data_week4_2.csv",header = TRUE,dec = ".",skip=4, nrows = 190)
head(data2)
str(data2) #so weiss man etwas über die Struktur

data2$X.4
dat<-gsub(",", "", data2$X.4)
dat2<-as.numeric(dat)
mean(dat2,na.rm=TRUE)

#3
grep("^United",data2$X.3)
countrynames<-data2$X.3
grep("^United",countrynames)

#4
Url3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" 
Url4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(Url3,destfile="data_week4_3.csv")
download.file(Url4,destfile="data_week4_4.csv")
dat3<-read.csv("data_week4_3.csv")
dat4<-read.csv("data_week4_4.csv")

names(data2$X)<-"CountryCode"
X<-names(data2)
X[1]="CountryCode"
names(data2)<-X
mergeData<-merge(data2,dat4,by="CountryCode",all=FALSE)
length(grep("*Fiscal year end: June",mergeData$Special.Notes))

#question 5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
head(sampleTimes)
length(grep("*2012",sampleTimes))
A<-grep("*2012",sampleTimes)
sampleTimes2<-format(sampleTimes,"%a %b %d")
B<-grep("*Mo",sampleTimes2)
C<-intersect(A,B)
length(C)