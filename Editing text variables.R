cameraData<-read.csv("cameras.csv")
names(cameraData)
tolower(names(cameraData)) #alles klein schreiben
## splitting der Namen
splitNames=strsplit(names(cameraData),"\\.")
splitNames[[6]]

#LIsten
mylist<-list(letters=c("A","b","c"),numbers=1:3,matrix(1:25,ncol=5))
head(mylist)
#wie ansprechen
mylist[1]
mylist$letters
mylist[[1]]

#sapply, a funtion to each element in a vector or list
#Teil des Namens loswerden
splitNames[[6]][1]
firstElement<-function(x){x[1]}
sapply(splitNames,firstElement)

##Peer review data
fileUrl1<-"https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileUrl2<-"https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="reviews.csv")
download.file(fileUrl2,destfile="solutions.csv")
reviews<-read.csv("reviews.csv")
solutions<-read.csv("solutions.csv")
head(reviews,2)
names(reviews)
## wenn ich bestimmte Zeichen im Titel nicht haben will
sub("_","",names(reviews),)
testName<-"this_is_a_test"
sub("_","",testName) #nimmt nur den einen raus
gsub("_","",testName)

#Finding values
# gibt aus in welchem Element das vorkommt, also eine Zahl
grep("Alameda",camerData$intersection) ## grepl zeigt mir in wie vielen Fällen das true ist
## wenn due value=TRUE schreibst, gibt es dir nicht die Nummer sondern das entsprechende Wort heraus
table(grepl("Alameda",cameraData$intersection))
cameraData2<-cameraData[!grepl("Alameda",cameraData$intersection)]

library(stringr)
nchar("Jeffrey Leek") # Wie viele Char hat das?
substr("Jeffrey Leek",1,7) ##ich will nur die 7 ersten Charakter
paste("Jeffrey","Leek")
paste0("Jeffrey","Leek")#wenn ich keinen Abstand dazwichen will
str_trim("Jeff    ") #alle Leerschläge weglassen
## Kategoriale Variablen immer in Fakotren umwandeln. nicht 1 und 2 sondern Mann und Frau, so sieht man was abgeht
