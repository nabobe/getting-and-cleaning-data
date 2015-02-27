^i think #sucht nur die Sätze die mit i think starten, ignoriert die mit innerhalb
morning$ #nur wenn es am Ende steht
[Bb][Uu][Ss][Hh] #wenn irgendwo bush erschein, kann gross oder klein sein
^[Ii] am #start gross oder klein
^[0-9][a-zA-Z] #Jede Zeile die mit Zahl startet und dann Buchstabe
[^?.]$  #alle auswählen die nicht entweder ? oder . am Satzende

9.11 #der Punkt gilt für irgend einen Character. z.B. 9-11, 9/11..
flood|fire #entweder oder
^[Gg]ood|[Bb]ad #eine von beiden, ^gehört nur zum ersten Argument und darum muss bad nicht am Anfang stegehn
## dann müsste man es einfach in () nehmen wenn ^für beides gelten soll
[Gg]ergo( [Ww]\.)? [Bb]ush ## nach Georges steht etnweder W. oder nicht.
# vor dem Punkt kommt ein Schrägstrich um zu sagen, dass richtiger . nicht Metacharacter
(.*) # Sucht jeweils nur innerhalb von klammern. der Punkt kann so viel mal vorkommen wi er will (auch 0 mal)
(.+) # der Punkt muss mindestens 1 mal vorkommen
[0-9]+ (.*) [0-9]+ # minimum eine Zahl dann Punkt oder auch nicht dann minimum 1 Zahl
[Bb]ush( +[^ ]+ +){1,5} debate
# Bush dann space, word (irgendwas) space, 1-5* dann debate
{3} #genau 3
{3,} #minimum 3
 +([a-zA-Z]+) +\1 +
#space dann minimum ein Buchstabe dann space dann nochmal das wort aus parenthesis dann Leerschlag
^s(.*)s
# Stern sucht längstes Wort das er finde
# sucht dann auch ganzen Satz der mit s beginnt und mit s aufhört.
^s(.*?)s$
# s am Ende des strings aber ? sorgt dafür dass es nicht längste Möglichkeit aussucht
