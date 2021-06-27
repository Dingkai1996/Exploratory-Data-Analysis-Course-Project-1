library(readr)
filedata <-"household_power_consumption.txt"                      ##add the file "household_power_consumption.txt" into filedata
power <- read.csv2(file=filedata,skip = 66636, nrow=2880)         ##read the datafile at 2007/02/01 and 2007/02/02, which start at line66637 and have 2880 lines
dt <- paste(power[,1],power[,2])
datetime <-as.POSIXct(dt,format="%d/%m/%Y %H:%M:%S")           ##combine the time and date and change it into POSIXct type
datay1=as.numeric(lapply(power[,7],as.numeric))           ##add Sub_metering_1 energy into datay1
datay2=as.numeric(lapply(power[,8],as.numeric))           ##add Sub_metering_2 energy into datay2
datay3=as.numeric(lapply(power[,9],as.numeric))           ##add Sub_metering_3 energy into datay3
png("plot3.png", width=480, height=480)                   ##make png plot with width=480, height=480   
plot(x=datetime,y=datay1,type="l",xlab="",ylab="Energy sub metering")        ##make first line x=datetime and y=Sub_metering_1 energy, type is line AND set "l", xlab is none, ylab is Energy sub metering
lines(x=datetime,y=datay2,col="red")                                         ##make second line x=datetime and y=Sub_metering_2 energy 
lines(x=datetime,y=datay3,col="blue")                                        ##make third line x=datetime and y=Sub_metering_3 energy 
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),lwd=c(1,1))          #draw the legend at topright
dev.off()                                                 ##turn off graphic device

