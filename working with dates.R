d1<-date()
#class ist ein Character
d2<-Sys.Date()
#class ist Date
format(d2,"%a %b %c")
%d #day as a number (1-31)
%a #abgekürzter Wochentag
%A #nicht abgekürzter Wochentag
%m #Monat
%b #abgekürzter Monat
%B #unabgekürzter Monat
%y #2 digit year
%Y #4 digit year
# in Datum umwandeln
x=c("1jan1960","2jan1960")
z=as.Date(x,"%d%b%Y")
z[1]-z[2]
as.numeric(z[1]-z[2])
weekdays(d2)
months(d2)
julian(d2)
library("lubridate")
ymd("20140108")
myd("08/04/2013")
dmy("03-04-2013")
ymd_hms("2011-08-03 10:15:03")
ymd_hms(....,tz="Pacific/Auckland")
## time zone
wday(x[1])
# weekday im lubirdate package
wday(x[1],label=TRUE)
