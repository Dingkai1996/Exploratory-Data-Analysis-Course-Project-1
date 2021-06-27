library(readr)
filedata <-"household_power_consumption.txt"                     ##add the file "household_power_consumption.txt" into filedata
power <- read.csv2(file=filedata,skip = 66636, nrow=2880)        ##read the data from the begining at line 66637 and read 2880 lines
str(power)
datay=as.numeric(lapply(power[,3],as.numeric))                   ##change the data of "Global Active Power" in the data.frame into numeric
dt <- paste(power[,1],power[,2])                                 ##combine the date and time
datetime <-as.POSIXct(dt,format="%d/%m/%Y %H:%M:%S")             ##change the data of dt into time class POSIXct  
str(datetime)
png("plot2.png", width=480, height=480)                                               ##make png plot with width=480, height=480
plot(x=datetime,y=datay,type="l",xlab="",ylab="Global Active Power (kilowatts)")      ##plot the data, type is line, x is datetime, y is Global Active Power
dev.off()                                                                             ##turn off graphic device

 